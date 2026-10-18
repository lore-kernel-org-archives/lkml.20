Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980224B3C96
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 13:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792329181; cv=none; b=QJ0d5TNR6dnvjrwgVlM+ms+pXVXystpP8l4ObXOCGGACuH3+i82uGv5F3Gz4QlKVVksTBBSeaAukRe7t+GOmxkqyB8ng0JvrDl1nTixyYyMmji6NmrGMkyN38mZwsQmubA0BKJxbmR4ucHw1Lngqu7ZhSf75V470pIy6MJYBKAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792329181; c=relaxed/simple;
	bh=N2JeCWLFfoU+fSPfPomIYnFMAghodOlr4AC/9OfNW88=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XSG2sorq+8OGiTUK3bNAf04E7ArZoUxOIcEIJJJgvlUF+jQ9axxhaxjSkIYUm9PAEbgmkQ9N5pcwSgJ+E+LJRgRpyCGGivcxYaqzyd8Vp3aVsyPK5uChdI5w7EedHQqwEZH8DwokxNbYJFC02HxhPGTlkyLdN93RB/nl2POQGcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PsDKbQcr; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PsDKbQcr"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a1e3b87ac5so2808545e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 06:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792329178; x=1792933978; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uEOyoCt2AD7D1bry5/d2H2T1Ku2G2ZXxRyhNNZRqt9A=;
        b=PsDKbQcrEit+ZAPBLg2rdlV54WnC1rSPf9fa6COnTmTIpwhJ85komqZ86ptIUVIP1r
         04nwskQKb4OoqS/hYekuNKODEZWEjuUR5piM6SGl7Zf0xp4J8Les2zLg16GpVjfPb1gu
         jbS/xEJFBfPcJj0TRDF3u71vX+4I7L0ykJ0BupM5pFCLN/0svlQjCnkp8fpCuXvC1Fe7
         De+CEdX9PrX7MZbdqPg+uLEccfuGOnhXp0DPBF1d5feGBfX8T5Y7l1MwETPWM39zCyB2
         XFu3pLOUlhXLZ+5qklPsMnd5+b/vke8QUwxhC6OvmqYM7Dk1rgOPdhI8NxwH/CUrkHkb
         CICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792329178; x=1792933978;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uEOyoCt2AD7D1bry5/d2H2T1Ku2G2ZXxRyhNNZRqt9A=;
        b=acyokD7I6I3nbB+fLhmVPqpY6EZ8Cxm/omTScyCIQk0PzwI4ArIEhSj4NXO7cUjlv+
         j/6vEl///gN5LQiUcydPvpCa+d/YxxhLN5VUWWL181qDJq7KquD9oZPgeF/fdIKX+Gpq
         WOyRQKicyc0p6vnZLO3ghddbgzn4JYvp4u+3DihVJht6VHPgrDXNUnQCcE9re/GjkK79
         CHleDoBvJqz5JAet4AObIMIrlsvwOs2rim9AGd2uK2JhOFru+GXPL+7kg7r+4B6UgH4w
         x9uS2ZsBdmx1z6JHm5mkExFE8XlpdMFQSFwNYCuJgEZG5uiwQvitVgE2JLx/ZeLKdGRy
         bgaA==
X-Gm-Message-State: AFq9FYLd5YYlIx9bDhcJgtAeCH4U6grGOrNkK7gbP3MkSnhqu/YCcSct
	XSEbyBnU3KqVmHLQQ+56gyDydcujJipBH1Gne4YTly9/4mMvuTXtiJb7
X-Gm-Gg: AYBFou1yDOmJ5td2czy7AnSAc5RFWXYyXi06HJfP1zLz54DAf2O1eCFNnhchf7MhC4Z
	LhYZbwKPAPwBqvvzNDKr+z1rRee/c4w7yWcRtzkUrsh/mn2DBC+i5Q9PUypoBeTA817yyiGc/kN
	CSBTnUv9NFBhwyK+iL+sMiKn5/3qMoRhohR+v12ynyEZA7l9CMtho33xFDG6dTsOo3a2o5tcxGs
	kLPcInrN1/k8k3oiE9WqZuE5Br7P3dHA189HxE3yGZG1RQvIF3LvKXWvsOqSqIc6EsqFflXT2Cy
	Jn73Lp4rVRJsmU7fddYhDRPCl0MjyyB0sAKf3tpHwF/k5nSXgxMOs38Pz3oQMGqVr29N2tmtC0j
	shhgDSlpaniDUQuoFYVEdxo6ptz904oBERcJRHtgwAmPGrjNQX707UOm+rrmuqsCWlnfe4KGWoC
	CUbWdMnDyugjNFrbz8rY0n+MLoCwnb+PUE6J59CuGizJa3+JBImFpD2NmGbP7q
X-Received: by 2002:a05:600c:3b2a:b0:4a1:d1f7:bf4 with SMTP id 5b1f17b1804b1-4a1d75fcdc6mr113855015e9.12.1792329177346;
        Sun, 18 Oct 2026 06:12:57 -0700 (PDT)
Received: from ubuntu ([102.91.81.230])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9b8b5fsm323603155e9.9.2026.10.18.06.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 06:12:56 -0700 (PDT)
Date: Sun, 18 Oct 2026 14:10:39 +0100
From: Comfort Oyewole <coyewole7@gmail.com>
To: abbotti@mev.co.uk, hsweeten@visiongravers.com,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, outreachy@lists.linux.dev,
	linux-staging@lists.linux.dev
Subject: [PATCH] staging: comedi: comedi_fops: fix alignment to match open
 parenthesis
Message-ID: <atTFT49xpaBEb7Wn@ubuntu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix the alignment issue in order to adhere to kernel coding style

Signed-off-by: Comfort Oyewole <coyewole7@gmail.com>
---
 drivers/comedi/comedi_fops.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/comedi/comedi_fops.c b/drivers/comedi/comedi_fops.c
index c09bbe04be6c..efa6dc6d40a6 100644
--- a/drivers/comedi/comedi_fops.c
+++ b/drivers/comedi/comedi_fops.c
@@ -2648,7 +2648,9 @@ static __poll_t comedi_poll(struct file *file, poll_table *wait)
 }
 
 static unsigned int comedi_buf_copy_to_user(struct comedi_subdevice *s,
-	void __user *dest, unsigned int src_offset, unsigned int n)
+					    void __user *dest,
+					    unsigned int src_offset,
+					    unsigned int n)
 {
 	struct comedi_buf_map *bm = s->async->buf_map;
 	struct comedi_buf_page *buf_page_list = bm->page_list;
-- 
2.53.0


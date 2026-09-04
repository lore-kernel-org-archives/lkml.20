Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAEE48F82C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519626; cv=none; b=ltLUYhMRRpFv9M8hEV/2WXr1j0oJcyTdS9YkdQ8zXQtEqVMn2ep72NDTRyRJkgRSmGZVDO4qijKAImTcxOIPtdPH9dDQ8htfwU7KhNLSNn3s07zYdQdZQc5a+nhnj6mWjN5hQq6qD+eus6sL6tIdn/l0Oyq28JqToyngk3YcZqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519626; c=relaxed/simple;
	bh=D1HsYJiq3/IJrL0A68+TQVDnYCASkWEpASFPQ54JDWA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=if3q1N7R15JLYPhHS5F4GLWofE42rzu/VnPmPCk+lRhXCN0JYMSWsf8/JZ8Z+DF7BOc9eIjdzkRYZ3Oqe28kix2id5mIqJOJJnINIMe7zbiy7T/S5lBqsZ2y/cfsO4FYSm9ufRFVDFHG8zFRok7L3qU3RXhDFn+dqKVweQzjAng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iY0Zp2Ek; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iY0Zp2Ek"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-6b35cc0a8c3so717492eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788519623; x=1789124423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hf87qzQdWU7nDso7lEJgNwStgrU6ezKmTVcIUejIfiI=;
        b=iY0Zp2EkcmucBI2MPxVz5/HklWaj9EKZeTbgwiZ3prCZaEY0kas/MLDHYD9ZuaI3Kp
         P+i1yDyihXJS4sPhAEIq0/0LAJ1vmLU5h8SCJp5FEIWslb50sytb2moBlhCHNHKZ/V7/
         KRdMSUblMFEyQugF5T2ZtxcRmJmiIMd/nt/DYsK2jTV3gKKar9cPm/qdVGRCCNt9FaTx
         l9ZowuLjbdRV4gTuevM3wWJJjt/KQ3tcJi6oH6FZDIiFR3iOGWIwNE5pVLySjyaONK8W
         mE8u3bLNLls17XWR2AgpYYau43CYB4+FCA6kNaRPOeI5i9gLRNjXkBpOtySwKGPqV5B9
         LKbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519623; x=1789124423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hf87qzQdWU7nDso7lEJgNwStgrU6ezKmTVcIUejIfiI=;
        b=pAAgCZhj1KVkoMRbjhPE4jbKQ9ws8JTt4hPxRnx7fiChlbqTwCDVp9C0d5ZdFQN8qd
         unlBy0APDOzC+w/30CWYXlVvzyjRrdsNjRzRc0L3pKT9L3g8nE4lWjFi4Xkby8Uw/gQe
         IWq8PgsDWWQ82h8F1rJAkjy5tIw3JS7+mSf0FHie6N6uzJKzoD73elEZhDj8djMqIBE5
         7w0CzKOyvNVuH92qhTMcYqjxYbLGr3TTCoBR5voFF9LDfmCh/53rTnK6ElHlvIrVYTkc
         h7c/5HzZFYTVkeZb7V78xAhXVI7lULNOFcktNPVvu9bbSqLJ9KgQW2N5baFeOM5cofKz
         n+7A==
X-Gm-Message-State: AFuF++nDUK4uGb+1qwcXU23PVBBc29EPjKUp33cMduXtoc4qpzgGD0Vu
	S0si18ClYVFhmaUVXuIae3XMoBWUPNLtcOsFJbm2PvIPAuW+IQ8O6Bl7
X-Gm-Gg: AYBFou0+A0xcWtVbNShgW/f2kZCbZ1Z4BU+9u+ewOmXps4e87xDjs7807q/YVCAJLsS
	+SwdW0vVRY6myP9lcPPdV1D4umecDolh5+ePuWp9v6ZMfcmYKddlg6MCPPP8buqZ1dtYfpN11/i
	W7bIsPV9/JZ79vKGpk6IlX8NQQ4+76JgAyTNaSwwTc+4EhQZv0MT6qeRmQxPUAFbO7LZIB5h0hu
	ovzQ8jG+0VELGVsnbX82ofgmgVICo5g1r50x/JbOjx1+dfzaW3zU4wCuyRUbFWOqT1wh38RAWi2
	1SAj/1BT5DuijSbIXKe3Dycv5AdKohsMMBc6HoE7IId4EzVNsY4Ys3IwC3p8Hn+CE8MSzf/9tYw
	ITocldF2LjxvwYzWnIq4Jqh2bkL2vOZ4jpJ5OdqcSnd1Zbl56HXNe9abT20/7doWi6ksuUWuQvr
	sYIiBSMn4utCPFjc/R6XGCYiffvQkDnLOV966LB/MCtMfH
X-Received: by 2002:a05:6820:81d8:b0:6b1:3db9:b758 with SMTP id 006d021491bc7-6b6fb3d2f3emr3486950eaf.9.1788519623477;
        Fri, 04 Sep 2026 04:00:23 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534df1sm6813221eec.7.2026.09.04.04.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:00:22 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] pcmcia: fix repeated word in log message
Date: Fri,  4 Sep 2026 16:29:58 +0530
Message-ID: <20260904110000.6304-4-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904110000.6304-1-hemanth.selam@gmail.com>
References: <20260904110000.6304-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the word written twice, reported by checkpatch.pl as a possible
repeated word.

Only the message text changes, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/pcmcia/pd6729.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pcmcia/pd6729.c b/drivers/pcmcia/pd6729.c
index 1b62ca30d08a..c8c4127c95b0 100644
--- a/drivers/pcmcia/pd6729.c
+++ b/drivers/pcmcia/pd6729.c
@@ -479,7 +479,7 @@ static int pd6729_set_mem_map(struct pcmcia_socket *sock,
 	}
 
 	if ((mem->res->start > mem->res->end) || (mem->speed > 1000)) {
-		dev_warn(&sock->dev, "invalid invalid address / speed\n");
+		dev_warn(&sock->dev, "invalid address / speed\n");
 		return -EINVAL;
 	}
 
-- 
2.48.1


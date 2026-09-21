Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E5743A80A
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 20:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790022217; cv=none; b=qv9DOgiznf81dnSq43TcYvdSQ0QP0jJJZjLhzBZ6gwOdH2mdPO8BLIq0g0w/p5epQxj00cFVL1ahpTC7LBQVH/7jWeJC3N24r3IDlniEli0buoMgsL9rQbT2YQSHJ/QbVDqLQRRybqJarx+p242k+M9AcFWqZ5G2i3crKJI587c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790022217; c=relaxed/simple;
	bh=EMSHMBLXJ7OjjOky8VG6MjiyVU6lAt33IegFuJ4N4Ic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M3L8AMMGXMDKJ3mMiUNPLlHeRzxdElvcv3RUFa/ntkGDRqjd7HpHPiubg7URzMpPz7SSwI29htaI2oD1DpJdOxsHydzkOmGpzZCtYAoLT9uC82HME5fERm2UwdyGB3QQMVSmUD6W8PIq/rL0pMF9KjRM4SHuFZ1Lj3CzEim+0I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BldHLbn0; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BldHLbn0"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso30072875e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790022214; x=1790627014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=02fnAy0mCKmC8pqwksm2IpR10fGH9x3j+39ZN9AwRyY=;
        b=BldHLbn0mKNwqia7lWbkBoKbbiha6idbplGJORPqyIB3opzKSdrEXhtDl/vEMS8qM4
         fDMFQwRh8KZdBKJn98AKIWwQ03oZ/+rfZfacMchNRqh4PWogGI76U0Rls7LX4tqQiOu4
         WdctGBIQ67mxP29srsaHYA+omvpj/aJ+I30BkSjtBDcuBj+DM7c2iE4+aHn3MwBQzOQb
         1SOkg5R5UqPw6To3mSjhKs5hhl4uBQmiFa2BENSjuMc/N/WEjcGh0cy5nzN2AczuQcOF
         QBuXdokCXEraIzPfREHH/Ay0DfdL3bJXluGPlaIXaP6EajFrvyRoiR/nIYek5VeMsceg
         2y8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790022214; x=1790627014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=02fnAy0mCKmC8pqwksm2IpR10fGH9x3j+39ZN9AwRyY=;
        b=O9PMH3clAx7DSLI2NrCYCLqR72UuhxnZRihioOs2/FkBJtoqLRaY+rZhZoyYAV2Mii
         u8Bm+Q2uGB26AWJ3qT4SiZqokFZ7ts6HNr8QPyebP//NzkjzDuv0DylH90Gyxvq0qwPH
         DzCAa8e9L81/XZL/DVJx1TlN4VlJOCzlTwp0A/8wEQ1ZekUu+LnhQuxYrRzR1UDeggNI
         S9GSH14LBt8KxsD0L9e1fmO1XtQJZJMWiLjX31XiGWjxdy5oMqeeWAJ/gFFi3dd4fCWA
         TYD3mfmv7BmrpA/Bsoe+diEw6D0jtbfuxDVhfSz1kW9ZOuEkB1bUPvS9NFNv4vKuavw0
         fesQ==
X-Gm-Message-State: AFuF++k29OYi2Lo167kssblnM4pEEHNcD67YgTNliVQLxjAL5UZlepip
	flWxmphWVjU2WUOwepZbdW5Y1HbYcLredl55uS+tvEpF/SWNqhbzg6lg
X-Gm-Gg: AYBFou0EScY/69MxC/w256LFYogIua91Cxmx8aJISYDfkxCXC5+5ZNqmhplLBvIGJiZ
	Wb5EPo3C8UlgqrP/bLgzPEaIPqOGpPG3zhgTAKeLmLa/TZ9VWX2i9BF+5ZLrB6JlDUszlVN6+Vc
	MDyf7bMesggM63CN48dTpoIu6wqIjPaT1DXso+Xut4sMmjp8xHUSt+/ofPg38OBmPeXogv6ytsP
	mnj+Yw5yh5CQEpIFVShyd8T3D9JA3u7NPyOMcLFGJLirhedH/N5eb6nvDmL2EcqYt/I5GS0rED1
	Z9yeeNBTg4ef1VGwlKb6Irk9CaOIgJ0ec8Nijbq9RUTZINJEg6HBlM622ApcGBAHmhvIU55glxX
	DYEt7WEPFMhugQH6LoyOpA/XjciJUp2nq29SvrD5Xmc+zur73QQfLntZDZ2jVrZzfNwXN0QVES+
	Dmz/evULxa9HjTU/SZC6ykcjeAh8zLXTVR5PtQNCIJTOF413OBS6htC1JS4WP6WKVFj6cE7HAFn
	JTYpnPVqKZmC+bbbMcsQYhOJFlpeZ8V6E/hocp6DuhM
X-Received: by 2002:a05:600c:34d0:b0:495:6e68:5df2 with SMTP id 5b1f17b1804b1-49fc56ef520mr165661445e9.12.1790022213842;
        Mon, 21 Sep 2026 13:23:33 -0700 (PDT)
Received: from andreayoga.wind3.hub ([31.189.116.68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fd8cd5214sm17778875e9.9.2026.09.21.13.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 13:23:33 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G . Piccoli" <gpiccoli@igalia.com>,
	Anton Vorontsov <anton.vorontsov@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Colin Cross <ccross@android.com>,
	John Stultz <john.stultz@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	Andrea Parri <parri.andrea@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] pstore: reject persistent RAM zones too small for the buffer header
Date: Mon, 21 Sep 2026 22:23:16 +0200
Message-ID: <20260921202317.70595-3-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921202317.70595-1-parri.andrea@gmail.com>
References: <20260921202317.70595-1-parri.andrea@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

persistent_ram_buffer_map() computes

	prz->buffer_size = size - sizeof(struct persistent_ram_buffer);

without checking that size is large enough to hold the header.  A
ramoops zone configured with a tiny size (e.g. ramoops.pmsg_size=1)
underflows buffer_size to a huge value, which defeats every bounds
check in persistent_ram_write() and persistent_ram_write_user(); a
write to /dev/pmsg0 then copies user data far past the end of the zone
and corrupts kernel memory.

Reject zones that are not larger than the buffer header.

Fixes: 404a6043385de ("staging: android: persistent_ram: handle reserving and mapping memory")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
 fs/pstore/ram_core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/pstore/ram_core.c b/fs/pstore/ram_core.c
index b4ec8009b8dc9..ae941777037b8 100644
--- a/fs/pstore/ram_core.c
+++ b/fs/pstore/ram_core.c
@@ -505,6 +505,12 @@ static int persistent_ram_buffer_map(phys_addr_t start, phys_addr_t size,
 	prz->paddr = start;
 	prz->size = size;
 
+	if (size <= sizeof(struct persistent_ram_buffer)) {
+		pr_err("%s: persistent ram zone too small (%#llx bytes)\n",
+		       prz->label, (unsigned long long)size);
+		return -EINVAL;
+	}
+
 	if (pfn_valid(start >> PAGE_SHIFT))
 		prz->vaddr = persistent_ram_vmap(start, size, memtype);
 	else
-- 
2.53.0


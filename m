Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794069318;
	b=vKNQOt9SMiPIegtKpbCt2knYF2FgMUY31wsZfLMTKINSAJGNNqAS3ioCR+6uGQ+oIVnn
	 REBY7u5r+q9x/6/nnxGKOq/O2Cjwxmd051py/UO3pDqdcBI8zHgzPV8q3tpiElxd8lffW
	 P6LPFah2xehVOiCua5+hmHkvoD416Ygri0kIl1E4gwNye5NWUpw+k1LgKooanRAXoA7ml
	 sY9APdGi75vUCyEoYTpW+UbsInyHPwDH2ScVjsa+GZYX3jT0F1s7nzwfACEjNQh8pVwoX
	 Ri/r+IYoe1cDbdIIXQfANAlqfGoCrrCVjyaaFj0ZBIaMLULd+DWYKE5Au9YdP9AHtKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794069318;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=20tO0gCqFaIMc3GUy21bEiP/bDZFkmSZ4ZjOjeh6U0E=;
	b=xzIk3lA4aeqaaDfpYFQHAxT29J2/JvavvkBBn306yLLL7HZWSZI0MWfjGWMbVFiDch/z
	 l/shooa8qZwvkrRKVDC5lj8kYKyv0uMgnHMLrztrleXnp+aGmsOac56h+o3FAnZNoHlYd
	 VqjfI4NPlSq1frX7mM/i8aBK6emJGfsNYN3ON/gv3HoIeyXMX9vJFdd4y6/dOLLJ0dwa4
	 m29XH/CT4F7g8kyr8rh50ugZYSqdZdXFRMg4COfPo2f5+J/F7yVSEZOEPvyTON5U3i62k
	 5SbnddZIuFltMj2go4Ev7Cp1c9Zss865eJ+gwZ0T2gCVnl7+CN2BAKrtDAQQiITvuTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=DApHBhDA;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF51B606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 16:35:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF51B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=DApHBhDA
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a07078200fso564009b3a.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 08:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794069317; x=1794674117; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=20tO0gCqFaIMc3GUy21bEiP/bDZFkmSZ4ZjOjeh6U0E=;
        b=DApHBhDAZt5cCtwwcJoPRrh15WgOWNG/OMKJZirFYhT8d+oxm6iFzq/eL5ldkox2GX
         3UY3SbBT9MtxOcXcDMloZaiJl2lsrBZ/pAvfb08N3szSDmilM38f8unUA33CJceejWdN
         SXA9XpbGQBdpmxCAvprHQQQKL7SoXgWukXDYc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794069317; x=1794674117;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=20tO0gCqFaIMc3GUy21bEiP/bDZFkmSZ4ZjOjeh6U0E=;
        b=gpMUGxJ7Stlh8iosz7XXGXSEElBSPuHw0ewPbfGlp0IEo5C81YAn1a0I5raP1OqMZM
         RN4NGhxVGdKwEZp31JUgt+osC+G8ccX6yzHERdJkwh5XjI1PJmfHvbNq/2jJAXLj83Ze
         rUTFTsvDkyzPcQsStU+eyzbYlVS9VHCyzORD0TYJwtXrl9BA/8ZcY2Wuo0YSoPq6+z1N
         aM+FtL5DcJ+EIIWg3a1WCQHYT8sHxt2CUaRby/kGqTR3jWZAJQvAJCSC7i/i/N1tEC9L
         H4/rbVn7jAI/9eqbgvq+eEDr5YhE/QacpwV8vAfHyp9ZHnaR3Cm1xF3u160iUD5s0/NW
         4pDA==
X-Forwarded-Encrypted: i=1; AKwUvBxeebLkXqVebXdte2wh3g0qA9f/64s+S9ingqhpZemn7Ozjl6lllNIsPJ+m/5XPHn577L/NvNbOkZI8Ll4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8IYK3gGLrk9evlRdaTUzeGdTZxeXAEbNu97s/XLOmwQfxu1H+q
	SEjCg4FuJnmIwsDAVyJjvsG2UZma+gH4ZMNmu0jgHxoP9fkuT8M/OhiSWW4Hwz4S2K1WzkIeK6x
	7bRASbYz4aw==
X-Gm-Gg: AYBFou2DVflJcDDUHZKEo8oYFosFE+M8Rfd8AcuY3yELjag+oWacWnrb4Nk0ZnX4jjY
	SogwnEAbrNAjFylSiqVmIOUGsgvZRmMl0flSqya8UYKozFeg8Ksd7RdwxcrlKQAPUa/LcZmPlRZ
	7pCVb5L4MqYL4SlqrFmCgLiy9qaRtvTJg2Xtv+T63KmEOtwwW2463+NjtnQtqojKE5djX4TIegK
	AnQYUfOah2ZXC7Lnaa8eX9GwipRNldFF6K5VGMKQU75QY7ViQUx/tG70xwaEVOZ7rYtOqXwaJF/
	bX5a4OiUxGxogDnndxTmDTQnfWpMBMFY8V9ZS0JQvGUTH9JMtoR+Lvg8TBVeYjFn0qQ1TjS25x/
	fLIonpd5D2tBuL4Lyvy3tBcstWhkRqXO/zI3I3BHU5n7dUFfjjQWZ7JxAWuYLws3KkM0o9FQBHk
	bJkdOH9gD03I3cg3xf9iG9pz9jleP81kz74mwmr2uEyah9KVbSSG8BcRuidJJO+m+pb9PRjPI4L
	oZfOTVRacx+cXpOjQl7dULCn1VzUZz8NmSSD7v6jdsDwghgS2c9IS1XCxIK/ENaoODlg/hUbPHM
	DGPK1zg4kSQlKurnNYGI92XpO5hjAsZJXxe8yKMhd7V3oAX6do9xE+nnePRJ0d9ZDge1Z+X3uo3
	JI1ZnxkOcLJZNzMzOu0pGFn14mIwVaqZLPdqzz3L4NQceg3deZqOmxqfdUEnqd7onhhSeRLszIm
	tbW0hzvpd+pmJzLBU51IC86VUYaQvxgLJ9jvM8+yRHeagtOY4VvyOK
X-Received: by 2002:a05:6300:220c:b0:3e0:c3f8:4821 with SMTP id adf61e73a8af0-3ebb2a0b0f2mr6449677637.41.1794069316979;
        Sat, 07 Nov 2026 08:35:16 -0800 (PST)
Received: from localhost ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb8f1ad3c3sm71870a12.16.2026.11.07.08.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:35:15 -0800 (PST)
Date: Sat, 7 Nov 2026 08:35:14 -0800
From: Chris Down <chris@chrisdown.name>
To: "Martin K. Petersen" <mkp@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>
Cc: Christoph Hellwig <hch@lst.de>, linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: [PATCH 1/2] scsi: sd: Fix data corruption in WRITE SAME(10) write
 zeroes
Message-ID: <5cb23933fe87df3c342d9805a7fe8c2a1e08ff37.1794069087.git.chris@chrisdown.name>
References: <cover.1794069087.git.chris@chrisdown.name>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1794069087.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

In writesame_10_unmap mode, we send write zeroes as WRITE SAME(10).
If the LBA or count doesn't fit, we truncate it and can return
success without zeroing the requested range. If the LBA wraps, we
can also corrupt live data near the start of the disk.

Cap the queue limit when sd selects this mode so large requests can
still unmap in chunks. If the LBA or count still won't fit, fall back
to WRITE SAME(16) with UNMAP clear. All the caller needs is for the
requested blocks to read back as zeroes.

Fixes: e4b878371b85 ("sd: implement unmapping Write Zeroes")
Cc: <stable@vger.kernel.org>
Signed-off-by: Chris Down <chris@chrisdown.name>
---
 drivers/scsi/sd.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index dc45df819c42..a28d11886aca 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -1164,7 +1164,10 @@ static blk_status_t sd_setup_write_zeroes_cmnd(struct scsi_cmnd *cmd)
 		case SD_ZERO_WS16_UNMAP:
 			return sd_setup_write_same16_cmnd(cmd, true);
 		case SD_ZERO_WS10_UNMAP:
-			return sd_setup_write_same10_cmnd(cmd, true);
+			if (lba <= 0xffffffff && nr_blocks <= 0xffff)
+				return sd_setup_write_same10_cmnd(cmd, true);
+			/* Unmapping is optional for write zeroes. */
+			break;
 		}
 	}
 
@@ -1221,6 +1224,11 @@ static void sd_config_write_same(struct scsi_disk *sdkp,
 	else
 		sdkp->zeroing_mode = SD_ZERO_WRITE;
 
+	/* Split large requests so they can still unmap. */
+	if (sdkp->zeroing_mode == SD_ZERO_WS10_UNMAP)
+		sdkp->max_ws_blocks = min(sdkp->max_ws_blocks,
+					  (u32)SD_MAX_WS10_BLOCKS);
+
 	if (sdkp->max_ws_blocks &&
 	    sdkp->physical_block_size > logical_block_size) {
 		/*
-- 
2.54.0


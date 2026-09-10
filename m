Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553602FFF8B
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 02:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789008281; cv=none; b=lXyYwBsAtYJY2CZRJTgyjM9xzaH5t8WIzUMmtxdH/Ua1u2G1vtFNph19EZYkeFLo9NMY8RMBR4ZrAabBAtrrrELwKmK/w7q1uzGA8WovnQduF6TDukmU0K/DuAgwnAdEeuTHXttHfqbx+Rd8IxgWKOjYaeFWgGLqT2L17HltbVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789008281; c=relaxed/simple;
	bh=5plLy/akUgnW+2omHUcDOEnJjRaaas6WdXfuN0Z4nP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f65pcQg6ukYps2wfaZzv6kzOW1ZncgMpRfr3FDyr99zrQnJxi4LVzUtEVlkA2W3uQHmCGtTfXTb6R1LPJAu5v4pMvEu+uArRbQ34G67AhvctRr6P9NPrKD39c48r+O++0HH8zduHK4FIpn7bRQQSlePS+CTNxiMlREuMnntXR8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=OzZNYWed; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="OzZNYWed"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c28fde3bbd2so631394466b.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 19:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789008276; x=1789613076; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RGo0BucmWwjHY/M/mqoExTi1Uj0ClHrt9derWN+gAl8=;
        b=OzZNYWedrQt0Kuhm8WYrVmlKdhayoZA+lFUp81rebzT9YcHezOjql2DcdqNX+BgEuV
         6YgYA+YI6GwG/pLQFrt7ev4+hK/LUxPpuw4cuOSXCGbzzDmXPWKYxEhVngW4nRB2LrXo
         rf/iLZn8e4WcUweth4/7XknF1XOjLXrXy6xqObUFRb88fFl1PVsKEI1fqdLHKnqlg5Pe
         UcJV/7pQmiH1AHgymlBAyAHJ97q9gPzOS7JTV6+obVR/lAgAH+DaGUZOJTlRU65Vq9vx
         +A8u0GCsdjddJK5rTma9N5rCJLfV58spmvd9TGCKxOTIAzxZXiVB0iRY62N2Q0HyHy0I
         Fyxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789008276; x=1789613076;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RGo0BucmWwjHY/M/mqoExTi1Uj0ClHrt9derWN+gAl8=;
        b=TvcdFh86X9RW6ArPVubu8i9aihL3K9jPEpKKtEzp+miPE9tc4K+a3Yy7krkkfmE6L1
         jlSvkdR4L+ye7cEQjfVaVNkpA+FPPWpmpEbcrHaFdfCHs0fFtoCZostip3riZzl25Qq0
         tW1Ng+m689R4VJU7imY3Wu8z6iVfOzwaPam5aJBSUzRmFOhGFqDP7CyxAVuyRLxZ+y70
         lCDwyzk4/dPDpLhydKI6ZAy5rYyJALYzqE+qSwFIMlXJk0kGhzdQ3u/YCrZ23bkK8umC
         k83KCmXP7xY1WGbdaM3vykvkkIkNmBFKTIFFc5jr4j2nEUeFN4inklYHhkXNyiMmp3Fd
         82hQ==
X-Forwarded-Encrypted: i=1; AKwUvBwR+79DVD+wBeNS8uY0i1V05SPDv72bhkH3EmJSPqI/q0Zj6ruiXGdLVBLEG/HffA/tWlljD0Mv1YxcA4Q=@vger.kernel.org
X-Gm-Message-State: AFuF++nwQUP1LtTtZ5OCrlTkc2BhdIf8MTkZkOXA3T4w8sgXXazY5z4s
	TGrStPb1NEfPH7Jwybz3qrw37bdxboFJbbIMozW0jF8NIEhT1JqBVE+W03f1nfzCqD0=
X-Gm-Gg: AYBFou3BUQSTKXZUF4BDUnZe+9MshC5KpvegQ9RofVRMqvfTGIrVytXYIxyAeopXXyj
	sHIPsqtEx0wBoplw93gmLf3qY9k6iLI1aq5BeHvUVVVHJSTOZsEG/9LD1sXPehC0hllkjLYgGIl
	wbNcWQoeUXKsqw0pEnBCwHG4xQcZTjCOsqyJQC1FPb0NneBAL4Ve00/HuHJezL+Xlt77vHDPchx
	Bm7wL6pz598xdrJbkzS/U/zjvYNx6blXPHn9NABhCnUT2TmPQdf5QO2i5Le3mLK9n1u32j6AjlI
	c1NOMN1X+nQSFyVFe0zcl4b2Eyxtjpfz/RZRCKdn0T82HyCehSf6lJ/rxgEMlaf3LlAFUhzgnOz
	8htJon2x5FQzYR861M46djyKC7/AbL7+48ficTwtYS4Yh/RnAtQufHwNT+NFqroiwUotdCGRnNa
	DZ9zDxUnm3N8xoCdE0KOqj+NdeKLy4RZbuj+dacz9x2lEleKGGEfsoafFsP0qctWOxTL9s37Rkn
	rjtunW20+M1lotWV0O21Zj/o387
X-Received: by 2002:a17:907:9494:b0:c26:1691:b362 with SMTP id a640c23a62f3a-c261691b930mr1596840166b.27.1789008276432;
        Wed, 09 Sep 2026 19:44:36 -0700 (PDT)
Received: from r1chard ([2401:e180:8d23:5f05:2c5b:a1bb:33f1:a712])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14841054sm81992665ad.3.2026.09.09.19.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 19:44:35 -0700 (PDT)
Date: Thu, 10 Sep 2026 10:44:31 +0800
From: Richard Lyu <richard.lyu@suse.com>
To: jarkko@kernel.org
Cc: fourier.thomas@gmail.com, jgg@ziepe.ca, linux-integrity@vger.kernel.org,
	linux-kernel@vger.kernel.org, peterhuewe@gmx.de,
	richard.lyu@suse.com
Subject: [PATCH v2] tpm: Remove ineffective wmb() from tpm_pm_resume()
Message-ID: <20260910024430.40418-1-richard.lyu@suse.com>
References: <aqIVn0cDBvIYKggE@r1chard>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqIVn0cDBvIYKggE@r1chard>
X-Mailer: git-send-email 2.51.0
User-Agent: Mutt/2.2.16 (2025-11-22)

The comment above the wmb() in tpm_pm_resume() states that the barrier
guarantees TPM_CHIP_FLAG_SUSPENDED is written last, so that hwrng does
not activate before the chip has been fully resumed.  It cannot do so:
it is placed after the store that clears the flag, and therefore does
not order the preceding resume work before that store.  It also has
nothing to pair with, as tpm_try_get_ops() contains no matching read
barrier.

Drop the barrier along with the comment rather than leave a no-op
behind.  Should such ordering turn out to be needed, it would require
paired barriers or locking.

Link: https://lore.kernel.org/all/a62fc816-259a-4d28-a265-e425bc17ed50@gmail.com/
Signed-off-by: Richard Lyu <richard.lyu@suse.com>

---
v2:
- Drop the Fixes tag: this is a cleanup, not a bug fix.
- Link to v1: https://lore.kernel.org/all/aqIVn0cDBvIYKggE@r1chard/
---
 drivers/char/tpm/tpm-interface.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/char/tpm/tpm-interface.c b/drivers/char/tpm/tpm-interface.c
index b4e749e70b02..0bab78c8767c 100644
--- a/drivers/char/tpm/tpm-interface.c
+++ b/drivers/char/tpm/tpm-interface.c
@@ -497,12 +497,6 @@ int tpm_pm_resume(struct device *dev)
 
 	chip->flags &= ~TPM_CHIP_FLAG_SUSPENDED;
 
-	/*
-	 * Guarantee that SUSPENDED is written last, so that hwrng does not
-	 * activate before the chip has been fully resumed.
-	 */
-	wmb();
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(tpm_pm_resume);
-- 
2.51.0


Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3300E3CB541
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790936258; cv=pass; b=lEqNEiX6Xjm1IZNVEovjKEdhnuvAquJkIjq0g2Ff3LDGX7rIwhSeFCJqjArfQug3gJs4pS6u3wWW6nU9Vkm8+TTX/tHNn9kbpGE01A47WoEx7tqsV8YVA/Qk1N040Pl9SnbhwmaTskGeIXRL6CbEFJw5yHB19/bCnCo/W9ByTBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790936258; c=relaxed/simple;
	bh=ZckUBzuxfDct7Xtg49y5TXXNnoeTTdLGKQnVGpqLnmQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=mv76HPT9LxicH6zMeKgyCDnhhcxLqC27HrwOoLwVDnV4a1qbPQCGcxHYVnODPYo9DmGIAohY1bp7f0EwXk8IkNv0FKdx4jXs+PgTKAF+wwYcfT/ZCrxoOC2QEWC0gbf2II0qIjXi/4LFTaJpC/MPNMcH1pYBioUXBEHaX8QirVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EonNVIOl; arc=pass smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EonNVIOl"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5bb54bd5076so1453818e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 03:17:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790936255; cv=none;
        d=google.com; s=arc-20260327;
        b=H/Ht0fGftUnmkKJAypprwiXTyblVmmhXep0zBHPQGIlA4Ahl6NeVK8i6W5kiHMk2En
         NmffrSkwO55De60nctN0UQ6lm8dfa45QXV8CXBGPkB1mSlNpAGh5aHBIoQCj1ERvo3pj
         66NDMTq5TEE4KIxSbXHJInkpQYZFTJJELcMgPg2hGkK/pjK0g1MSU9nXjuQMvb0XyRT1
         /oFaaQ6CWQL277KDZti7ApVy5VbqKw2L7RAl02Ol7sShFvAlfqc2rU4lAKxGAttUdDVB
         40FrxKTKhBjSwquWZSsPbwfod9nctjuZ1PciL2Anm/kb+5Ao942QWFX6Sbvwnc/ORCQ2
         tPHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:sender:mime-version
         :dkim-signature;
        bh=Pu/ssd8DugN/kj01xDDdGW2HkDyQcHTA/d4qIgsVPkw=;
        fh=kSv6lElq+CEaLSb5TJNBJp0gGFuHmptKwJIaR6oMXVA=;
        b=Dq1mXDPYK+S5nYY7GOY4wItHDhcebcbC8Ex/5xVA0vHLGZ25prWR6YKlHzzPRn5kj1
         5FH7DM31YCFl3jE64yMSc/b1UgJGvFa6N+uCaU4djHA/4u8zeyA9GGQga59OTlAmcMF7
         9YWhzSnIL4Jy5pc/kaxHfdRZCodcQwRapHKSl4x937mAPOwZRgDAPoDaHArbvv6sD78A
         A3U3yUKeqvkirG2gNxcxfbbw98a2/jleB7FMKHGJ+jHnVJwc+cyKCqIL9Z/IT6OXZGg1
         vK252P7IjaiCCRC7A/sVwUIkiBJhoKDUPhzOZYmaODw8scMCg9Kcz3Y3w36sE3viDgAf
         qY/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790936255; x=1791541055; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:sender:mime-version
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pu/ssd8DugN/kj01xDDdGW2HkDyQcHTA/d4qIgsVPkw=;
        b=EonNVIOlF+cFCJCYJYKU6KJkZjZNdysmtCPlTbyQKrOXOPlzwfdw+EUCRclT1VUHoA
         WcMBiaQcH6nqw87mDTcNbmHGcIgboJshCez3jYSWcgnIwX6dxLjaVmc+VdiTQWqtt7EV
         vhFImDC5fv6IhMrmaY4F9X9fvc90nkJHu53T7Mum3Zx0A+HWVDqkPNlCQyrLl+Rey6Pb
         umqnjvXTh++rmf2BIE7H6+/MGNkq2j12ZvgiUmVquWUaN8XEWMUkoYlJnjG7HmL7VIKc
         VN6688EVh6gJXsgPuczbueH3X+MeAhgndBvLHD02uc7cXWlY881dJRQVzp9muZcxOKGA
         dc5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790936255; x=1791541055;
        h=content-type:cc:to:subject:message-id:date:from:sender:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Pu/ssd8DugN/kj01xDDdGW2HkDyQcHTA/d4qIgsVPkw=;
        b=ELzBdwQt1vUP6gxjs6vEn7qU0NgIB6CwdQf48WhcNeNsp4w4QNaRPsjDMoTtpwV+EV
         5H1zqdFnp2ru4xTCxBoUlHPxY29xEPTDlMcU83TMmDcvkUPpmap4Jwi9t+PYBYsmqjBO
         rLH2nB1XaIIaSHLZtnIfQ3eSAr7gRkdyQTgVMKsiXr77A7am2TMsl8V9QA6rDW8S8iap
         xb7UTWAs0CAOfl0s/gmW7XQcLcLaPywO+7FWdEpMchmK7ggjcJWdZ7klYpzs9YvnzUoG
         UZdFi0FMCiEuwqdpZPvonEMmXfQdR1hW5RtzijmUo/TT+sgn6bXEyVGs+IyrghcnDh02
         1G1g==
X-Forwarded-Encrypted: i=1; AKwUvByjX4nEgMaw6vaM3Y1rWaNeNi21OcC6j0Ia6BBJJumMX80vqEtbthy4vLgpkA72adwGP5Bv34/hBOkxVjU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFblvbxBOYCJqi2fYhj5gPYALhv+3za6E2luZrQpEngYxcBqnq
	2uxviqWECGjbOqhrg0ED54lSdlCBMvwIKW4+xmPi2dQUbVSO52ypk5mjdlvLOxapHNmdXD0CssP
	CFamp4rjEXX6IDrCGcF0RFsEwy1hh86Y=
X-Gm-Gg: AYBFou1/o35QKBFNC6deB1fNJfal6khFe1lgpLCev7cfbsD6TBmHgwSGeFrVWet7VG8
	/woHCEAuVM1coICNbTZVr2gQr5ftdM/qb4KBwIKYCehofvrJg5q+TPSURhsI3UGU2cDtJi6vY8u
	UuS+2gbTfr/+1KWjL8iHiu75VorjF0WcYtPJE/bgdOJxoXzdGrMw6lA86uODlBKCnYvwA7fTHiM
	y2SvdQj7vDRMmC8OUN/cTZoFJmmA2gLfRgdSyit9xR0tWYc9hs8IlL2612+l+RiRhTuK+AS6OGl
	INFIFu1tv0D+XYcLowNNfNPNaTya6cpt5V4l0wvcnTS0VPVQKlVI544/Fo/di2MgFJVTarrgyEz
	OOubinPvwv0Hq
X-Received: by 2002:a05:6512:6c4:b0:5b8:b3a5:827b with SMTP id
 2adb3069b0e04-5bba4bad0b8mr860497e87.40.1790936255129; Fri, 02 Oct 2026
 03:17:35 -0700 (PDT)
Received: from 254448290189 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 2 Oct 2026 03:17:34 -0700
Received: from 254448290189 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 2 Oct 2026 03:17:34 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Sender: Vamsi Krishna Kattamuri <kattamurivamsikrishna17@gmail.com>
From: Vamsi Krishna Kattamuri <kattamurivamsikrishna17@gmail.com>
Date: Fri, 2 Oct 2026 03:17:34 -0700
X-Google-Sender-Auth: b1pJKT9Z1GEu05wo2aWT0OXX6Hw
X-Gm-Features: AclHuK-XNwrA2EcOc4Po4ch6BRKkhiv-zVlU7CDstfm5bS9uo236ZWXHKZYEhbU
Message-ID: <CAANnmVA26uyaCx6_Ph=BpdUyfoNH79KzparVquuv=BWqa_Mp7Q@mail.gmail.com>
Subject: [PATCH] ufs: verify cylinder summary size against cylinder group count
To: linux-fsdevel@vger.kernel.org
Cc: brauner@kernel.org, marco.crivellari@suse.com, ali@iusegentoo.com, 
	kees@kernel.org, jack@suse.cz, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The cylinder summary buffer is allocated with the on-disc fs_cssize
value in ufs_read_cylinder_structures(), but it is indexed through
fs_cs(i), which expands to s_csp[i], with the independent on-disc
cylinder group count uspi->s_ncg as the only upper bound - see for
example ufs_new_inode(), ufs_free_inode() and the block allocation
paths.

Nothing requires cssize to be large enough to hold ncg entries of
struct ufs_csum, so on a crafted filesystem image where cssize is
small and ncg is large, every fs_cs() access is an out-of-bounds
access: a read when scanning for free inodes, and a 32-bit
increment or decrement past the end of the kmalloc()ed buffer when
an inode or block is allocated or freed.

Since the summary arrays are only set up for writable mounts,
triggering the out-of-bounds writes requires nothing more than
mounting a crafted image read-write and then creating or deleting
a file.

Validate at mount time that cssize covers all ncg cylinder group
summary entries, and reject the image otherwise.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Vamsi Krishna Kattamuri <kattamurivamsikrishna17@gmail.com>
---
 fs/ufs/super.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/fs/ufs/super.c b/fs/ufs/super.c
index 3569ac92b065..2052d5225d03 100644
--- a/fs/ufs/super.c
+++ b/fs/ufs/super.c
@@ -1139,6 +1139,11 @@ static int ufs_fill_super(struct super_block
*sb, struct fs_context *fc)
 		uspi->s_csaddr = fs32_to_cpu(sb, usb1->fs_csaddr);

 	uspi->s_cssize = fs32_to_cpu(sb, usb1->fs_cssize);
+	if (uspi->s_cssize < (u64)uspi->s_ncg * sizeof(struct ufs_csum)) {
+		pr_err("%s(): cylinder summary size %u is too small for %u cylinder
groups\n",
+		       __func__, uspi->s_cssize, uspi->s_ncg);
+		goto failed;
+	}
 	uspi->s_cgsize = fs32_to_cpu(sb, usb1->fs_cgsize);
 	uspi->s_ntrak = fs32_to_cpu(sb, usb1->fs_ntrak);
 	uspi->s_nsect = fs32_to_cpu(sb, usb1->fs_nsect);
-- 
2.47.3

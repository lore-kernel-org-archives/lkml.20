Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962201;
	b=Zi+aEOnQDayaWPHjF0CuCN/+jHNitq2mN94UgKC+SHJubf3s/NezU8MFiDw1pIk/TK/L
	 J9JM0aiPAxrvn7nxr4XEX8VZtkXFXeYkGb8BqrPltmoFrb0mzTOQWBN98nJHTR1q6TsDy
	 1mhqKDG2mvEPsdxuAL5JlOenCGri58OkbU2hjMY8J6hDShIpc4NAE7UcMl4PuUYSAX0+l
	 F7PcgRWeUzpgdgD93rtTUhS7lkpTqiLoNQeI5QIU8XT+zlso68vs+L2OO5FTLEN9gOzha
	 RM1AvW+gEqgXNppXYkrS/8Wc25dwCE5+oL9yOpr8qnvQXG5v0scYDbTY3CT/Lqzrv2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962201;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WDLZPh7PUmv3CPLyOhpFsyhjmlQuKfntG555/rG5jRU=;
	b=BDnHdh+8Vc3sxWW09gRCeFpiRJXHCOMRcT0D0ITstJmh2TJktt5oJkVzzTsbZf4LIKrQ
	 WErWDcB4C3CQOTOn7ID8LVOPBB/etgcLaj7tI/+plckDhbsmBM6J2BR103gtrR39rHF+U
	 QUXGmB3LiUNshXDNu3RGEdC9R4dkktPqgsqswMJq1y+oLkf5BNzVUmNEd5SUxCEwNSmFV
	 66iYrG7jFE0aBVT9bIYURBx6xEihnbrKDA8PVY9OVPUlFkakXYIOOto+koXTznvGf33LJ
	 I3X2UlWf1wvM+vkYaFBIS/JVnasvZcNTNKGLP/6jWEaQ8UXuWz8seLqNk8J/MmZ+SZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gmQUgS2v;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4186606A32F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 10:50:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4186606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gmQUgS2v
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b0a519049aso328030a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 02:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793962200; x=1794567000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WDLZPh7PUmv3CPLyOhpFsyhjmlQuKfntG555/rG5jRU=;
        b=gmQUgS2v5vNPYtHdSWaMGw2CYsaHiBn53zVtNJXMW7DGq08KNxmyovakHCy1VOGctZ
         1MgDuQm97ZEyLvuwHHpcEk2w+mta/EuGYmYWODLbr7uylZPV9x3ObF7NVg3lqxAMNrbC
         EPjsGpa/wkp2nyRNTVatQlQFzEybNs6fZEZAZwfv5Rj5BOzEfvDkVFDLuKPO9/sxcown
         YDIRh4ze4WaystuR0MXpzSDaGhEyd4wZyf6IAnBVwil4Kw4RkpOkmWNY+9JUz5KTm7nS
         EqkcFHasdvolN/F35OQpPrr2wV6S6Ul230YPQb8uF57bWhy0AeGQuJ+3EYEQybidCfYS
         QGTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793962200; x=1794567000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WDLZPh7PUmv3CPLyOhpFsyhjmlQuKfntG555/rG5jRU=;
        b=z1YxNNGgPH9sWjHD1eWYChalNJTSv78V0yooWGCkpuFbnrfbJ4+j83cCBA1dZ8Mjot
         9WPNeKZdiJERfYL+yGMNNV5n4Sk2+WERWoWYIO+twiXMSyB0BOyU9QHBPpgDjOb3IIvQ
         dNtNXRADwAL+MnSJSpkw7HI2sk2yOQHvNLBdTreShhta9bz69v1nvIXgHgCqKupa0PfP
         1GJ5dpw1ceXmsmWxXqoNJpocQ7TvHMH0CixxcX0yQLtP2uS6wlLW92XYTnaMlU464gOC
         HyqyOeZ0n1h4dU9qeoHRHD8ILg0pB0+52zWh29GmwFG/EnKwxw9QS+4TQ0cVK3qDCg+f
         NFPA==
X-Forwarded-Encrypted: i=1; AL+hErEQ+ekJar/HnxQ433wbP+zJX6lajc0VD0HAkH4rEXGuzXWnYuvj1IHrEEPwSSF1eyQzdheH5jxvz/GMESI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+apq+mDa2ErlY+LP4rbsdXt4YQfalVDRqcEploiEKBHKzJX349
	eU376sn4otGxmE/LdWeYpKXuCzWFmEpGMbTQg0fat6FSX+qXeOc6y+/O
X-Gm-Gg: AYBFou2wmRCguy+zvyFFNJHCZTOWqeV5fzyMo8POEY3ZM3VuRaID0Fc0wxXU6XBdYzS
	8VyYABGzLikda+hP/p46SsYvBgO6b1DBBBbkZn93tmeI1eitohfsVMp+wMIF08GtVqBf2kkcgTk
	FL5p29BGjcEX8PWeeEuIiV6l35ii5/TIqyvTDoYHjjhvn37rll0bsYSUmsmxCM8y4vi6Zxw1w4E
	bRAY/VQ+mPfXV1YdTaHK0bNDf/Ihurm0VUj7pvDK+gkkbE/g5bkWZjArcAskobsOo1tffBABNkp
	mEGru2zl9YK55NgI3mkjsYMsw1Jt44PCWEbAZ0zXK+h4GQofjN/45jb7nu320toKdBbcPYelPRv
	CxuyrBMtIzz15iqgOCH6bMl1e+iTLZjpcD67cQhBd2tasnWpYqkCQiOn2uDUTbzFXtoWcmzH4lx
	AJxYmyprDauzl5OHAqIYyK/Tz1xQwDuXpQF//RxrnNTdwGl6FM4uLARomIVNT8wWXRdEqS+m3KJ
	ERnhC7MdrTndCgoHriohaidJrZirklSXn1j4tfRQNoti2ialkW6p0i1Gnou37t82Eqm2dQGwHTH
	pxHZ0cC/O181h5oXhsxknUnKimANh4vKQMhIyXrLxA==
X-Received: by 2002:a17:90b:2d47:b0:3ad:ce24:acfa with SMTP id 98e67ed59e1d1-3b0db6b0d42mr2120526a91.20.1793962200200;
        Fri, 06 Nov 2026 02:50:00 -0800 (PST)
Received: from localhost.localdomain ([183.62.176.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7c8a3d9sm3747364a91.10.2026.11.06.02.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 02:49:59 -0800 (PST)
From: liuyong <pkfxxxing@gmail.com>
To: Paulo Alcantara <pc@manguebit.org>,
	Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	security@kernel.org
Subject: [PATCH 1/2] smb: client: validate descriptor headers before query result allocation
Date: Fri,  6 Nov 2026 18:48:35 +0800
Message-ID: <20261106104842.441067-2-pkfxxxing@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106104842.441067-1-pkfxxxing@gmail.com>
References: <20261106104842.441067-1-pkfxxxing@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

query_info() uses the server's returned length instead of the caller's
minimum when a dynamic result is requested. A zero-length ACL response
can therefore return ZERO_SIZE_PTR to id_mode_to_cifs_acl(), whose
ownership-change path reads dacloffset before checking the header size.
A KASAN-enabled test shows a read at address 0x20 and a kernel Oops.

Validate the returned range and the caller's minimum before allocating
the dynamic result. Keep the reported length zero if validation fails.

Use the security descriptor header size as the minimum in SMB2_query_acl().
DACL-only and SACL-only xattr queries do not require owner and group SIDs,
so enforcing MIN_SEC_DESC_LEN would reject short descriptors that these
queries could previously return. The rewrite paths validate the required
owner/group SIDs and DACL separately before using their contents.

These issues were discovered and fixed by Qihoo 360's Tulongfeng
multi-agent system.

Fixes: 9ee2afe5207b ("cifs: prevent copying past input buffer boundaries")
Cc: stable@vger.kernel.org
Signed-off-by: liuyong <pkfxxxing@gmail.com>
---
 fs/smb/client/smb2pdu.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/fs/smb/client/smb2pdu.c b/fs/smb/client/smb2pdu.c
index f85595136..72166d49f 100644
--- a/fs/smb/client/smb2pdu.c
+++ b/fs/smb/client/smb2pdu.c
@@ -4023,6 +4023,14 @@ query_info(const unsigned int xid, struct cifs_tcon *tcon,
 				ses->Suid, info_class, (__u32)info_type);
 
 	if (dlen) {
+		rc = smb2_validate_iov(le16_to_cpu(rsp->OutputBufferOffset),
+				       le32_to_cpu(rsp->OutputBufferLength),
+				       &rsp_iov, min_len);
+		if (rc) {
+			*dlen = 0;
+			goto qinf_exit;
+		}
+
 		*dlen = le32_to_cpu(rsp->OutputBufferLength);
 		if (!*data) {
 			*data = kmalloc(*dlen, GFP_KERNEL);
@@ -4077,7 +4085,7 @@ SMB2_query_acl(const unsigned int xid, struct cifs_tcon *tcon,
 
 	return query_info(xid, tcon, persistent_fid, volatile_fid,
 			  0, SMB2_O_INFO_SECURITY, extra_info,
-			  SMB2_MAX_BUFFER_SIZE, MIN_SEC_DESC_LEN, data, plen);
+			  SMB2_MAX_BUFFER_SIZE, sizeof(struct smb_ntsd), data, plen);
 }
 
 int

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793958337;
	b=xziIGL5MvlJ8KN8N9lcdnYH+QRYFbZBnOMJ7XR9F+7DJaSwaVcp3ZFysF+MQ6e6gYdmz
	 VBZgZhdmVpxrVy+Fqgj+WXM4owP01tl3Q842gXc0eNgTrUXwN2190vQ+qLbuRZ5Z0PUJl
	 5W7Re0l61OSgg/381R03q+cZEq/Jf+a98BjbdopVAuQqDn+r/J5Pqi0zKH2eyF157jFYc
	 oDtuFN9ABm8O6H3uIpM2LhESskBDPFWWuhwfzD4NwuVzJh+G5vjkEumYgFPe4hgReyv+C
	 TNAf/yJxr3PM4pK1dEiDbt5eOvF5G8v+0R7VCZEgFT9X10vL2zOO9O2BMF8OjNxZbBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793958337;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dKZSeqgbkMQyFVAGTenY+vWDa9hVzBnn0+B7i3zsr7U=;
	b=sKNpR4IthmaTW86D2Qk8dYQoAVP1eM2JraEcNdgmoc30aOVx2BAwHGnGHSp46xfX18ZW
	 WtdviHYwH0JAQLJIj5hhgsrY1Ldcii4XzUnxgtYI8H2h0YgqZ2IMe2FmuK82VSzG4bH8+
	 8nw4b0jpYQNVYF+cXUj1Bj8YY1w6hLKNG9fsOz2mxrims0y/UyN5LwvTYfEBYpkG0PyM0
	 DhupPGopgRyZ2pvOLYdsRQ94xqQEiROBZupy4RC1qpx3hXTU05l2/9CPhg3rbbNzybCt+
	 gvk7IAjO1V8kKiPX9EN+GiCSzUsqkcI1eAXB15Bj3UGpgVs7/SCy1tL5QsPfhVtBw2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q5LrCFsK;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF05C606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:45:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF05C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q5LrCFsK
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc7e79c1eaaso210228a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793958336; x=1794563136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dKZSeqgbkMQyFVAGTenY+vWDa9hVzBnn0+B7i3zsr7U=;
        b=q5LrCFsK+e3dv8EdOMLzuHrfvQS2xsdL80z6yfvFGXSZmbEtDX3VHH/5htqLz9HKau
         7fJfLLIVTe/lDA8VNI0dgITRCZzoDXiH87aRS8losW1jIRrCltrHQ1o1k8zw4AUcLDll
         wzbbwhpjnXrabkiGte7wpzjDkVskdoGJKzZI6Jr3tC3ZMRLX3W8JurNygKhYRm9XbcxU
         yC/PwT69rWmEva3zs59gJgZlA0nFfVbG4Nko7+yUTJllT7K5q3qVsTBAPQTdtgjmIdWt
         XtJxE9K74A/CpLlj0k/nPJ0Ssu5JLp+N0pgDAeGqRolP/6+F9WNjQT92kDHRFNLFuoqY
         lYlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793958336; x=1794563136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dKZSeqgbkMQyFVAGTenY+vWDa9hVzBnn0+B7i3zsr7U=;
        b=emWJCKAMurI9xGVgCp1Jr0Twikh4LWEhQk5o7SuO4xiiPQS0HtDAyLcneDlV42mGiv
         v4wbdSUgRoTBXR1WSId0Kwrr4RgNorrd7YCZ1EKK1av9TfSRVbB5ZNY3olEqyIjTLOTE
         ZnI1uNJrGYNvauuRQCx1nwyHotdKJDPGPWkX0pPmpY0Ru0kY3Z9sZJMX9+g5MC8yrZju
         q5zX8cI3GKLR99WS6flWokemIZw6ZN1cT0wY5D3wX8CAip7vTtMvGQjGKBEPrMvsjXQl
         QicY9ZuYzyGLbLU1FDJCR0zLcbFQ9Kv8HlJwP95JkYlZbmGbw4i0li/ejYBwifQQIt8D
         j6Gg==
X-Forwarded-Encrypted: i=1; AL+hErEpJMF1P2rqdYHsZ2IknpTV23bb45HAyvfIP1jyLgKug4W495xfzK2bOlTStBMxSfmw63Fqf5Qz0TxZUX8=@vger.kernel.org
X-Gm-Message-State: APuU4Z88RILZLtteATkM7qSLRMVxhesNWKLimOhjj2FM60t9llcfa+jt
	hlyl3KRYU4TQjJ8RcnYpyd6O5ggeUkPshRZIa+Y76PNze+Vg1wDvx0FrF6xMNmj+
X-Gm-Gg: AYBFou18DTp52EbRg734J/+C1JsnmsvLytakX5KHrW/ED8jE7lwcBo5qLj3KuUJ3rhe
	3yoCLCsLhrzHgN47h76fIEx/W2U48Z1V3PeLRdo7ctO1AIJrM0Ytq0ktYHlgK3tiVxt5BjyDSUl
	h8JhGO8gKBx+vkudJAs4aEk7FVEWXYiDIfcW67Qr7SpL3rGspHyxPH7Kkevqll1tfULSnO3Borf
	95pkLobBAja5CDOUIYH5mgLSh2UkkJs5tN3PT4uoM8VLcU3rzLLsZ3CGt7uLbwnIjvOIrRr3nXA
	CkF5dftoN3WoRa82gbVXwQGYkrbYpSsy2ouMTzQeVLnPAKr870HE6suz5HYcRuUYVerOBZZeTQM
	RaXHuUuImyY+bv5HAzKgYcztU02Sc9P488AJZ/IvlIWl0lFi4t59tS5SMVSKA04e2tQOixkWRtq
	4SLDj0ciZSVMQkmDAacVqjdrrLl4xRVkZkAWquSre82gY8YIFS0jNRwEo3Ld0onVX5hHx7Y56nF
	lMNCgTDVWxEDGnDRqfxFS4sMFb2ZYLKPLeuqkfKf65SaTRFc0lHlpWKWXi8vhpZnOZaG9viTZ3n
	9CcCyX657T4KcTSwDsu2cs/M8z75u5Oc1cvA04HodcIg1j2+
X-Received: by 2002:a17:90b:3892:b0:3ac:77c8:ac29 with SMTP id 98e67ed59e1d1-3b0db6d78bdmr1674541a91.15.1793958336106;
        Fri, 06 Nov 2026 01:45:36 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b32baf86sm7049969a91.17.2026.11.06.01.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:45:35 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Russell King <linux@armlinux.org.uk>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] adfs: bound big-directory entry name length to ADFS_FPLUS_NAME_LEN
Date: Fri,  6 Nov 2026 18:45:16 +0900
Message-ID: <20261106094516.2401170-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Hyunjung Ko <hj351016@gmail.com>

adfs_fplus_getnext() reads a directory entry's name length straight from
the on-disk big-directory entry and uses it, unchecked, as the length of
a copy into the fixed-size name buffer of the on-stack struct object_info:

	obj->name_len = le32_to_cpu(bde.bigdirobnamelen);

	offset = adfs_fplus_offset(h, le32_to_cpu(h->bigdirentries));
	offset += le32_to_cpu(bde.bigdirobnameptr);

	ret = adfs_dir_copyfrom(obj->name, dir, offset, obj->name_len);

obj->name is char[ADFS_MAX_NAME_LEN] (260 bytes), but bigdirobnamelen is
an attacker-controlled __le32 with no upper bound.  adfs_dir_copyfrom()
only validates that the source offset+length stay within the directory
buffers; it does not bound the length against the destination.  A crafted
image whose directory holds enough data at the name offset therefore lets
a single entry drive a copy of up to ~4 GiB into the 260-byte stack
buffer, a stack out-of-bounds write (detected by CONFIG_STACKPROTECTOR as
a corrupted canary, or by KASAN with CONFIG_KASAN_STACK).  The copy is
reached from both readdir and ->lookup via adfs_dir_lookup_byname().

The old-format directory parser (dir_f.c) already caps names at
ADFS_F_NAME_LEN while reading them; the big-directory parser has no
equivalent guard even though ADFS_FPLUS_NAME_LEN (255) is defined for
exactly this limit and is used elsewhere (super.c, s_namelen).

Reject entries whose name length exceeds ADFS_FPLUS_NAME_LEN before the
copy.  255 bytes fit in the 260-byte buffer and still leave room for the
4-byte ",xyz" filetype suffix that adfs_object_fixup() may append.

To trigger: build an ADFS image with a valid F+ ("big") directory whose
header, tail (BIGDIRENDNAME magic, matching masseq) and computed
check byte all validate, containing one adfs_bigdirentry with
bigdirobnamelen set to e.g. 300 and bigdirobnameptr pointing at 300 bytes
of in-bounds directory data.  mount -o loop followed by ls (or opening a
path under the mount) overflows obj->name.  The check byte is a computed
checksum, which is why random fuzzing rarely reaches this code; a
hand-crafted image does.

Reproduced under KASAN on 7.3-rc3 and 7.4-rc1 by mounting a crafted
ADFS image and running ls: KASAN reports a stack-out-of-bounds in the
adfs_fplus_getnext() name copy path.

Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 fs/adfs/dir_fplus.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/adfs/dir_fplus.c b/fs/adfs/dir_fplus.c
--- a/fs/adfs/dir_fplus.c
+++ b/fs/adfs/dir_fplus.c
@@ -191,6 +191,9 @@ adfs_fplus_getnext(struct adfs_dir *dir, struct object_info *obj)
 	obj->attr     = le32_to_cpu(bde.bigdirattr);
 	obj->name_len = le32_to_cpu(bde.bigdirobnamelen);

+	if (obj->name_len > ADFS_FPLUS_NAME_LEN)
+		return -EIO;
+
 	offset = adfs_fplus_offset(h, le32_to_cpu(h->bigdirentries));
 	offset += le32_to_cpu(bde.bigdirobnameptr);

--
2.43.0

Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD493F9265
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791903533; cv=none; b=am7IvdNLNLyryRyhbqoFg+1P8VT/TU7G3HdassjeohZ4T9coee+G8KDu1o0B4Gl+x92TDNKarijD7OOY9MKavL27V0t0xwW9rxigS7Xrr090Y+yANNjaYeJ4nQooOrI6T6nO0lwmcpUNMUNIUpgtNxNn8b7WRcaZxSMcxhyc+yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791903533; c=relaxed/simple;
	bh=5XTF+lbN/3XQzs07ZUpzVUN/0HcjsBHSudr3yav8th8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VHczbII9dHjAgu6Qx6ap3r8TXKHiCAf3KUQuszWFW/dTLD5rQII80du4X/zDLTJLE9/o05//Qi7VfQNbGv1ObPGyvFfFXX7vG6boHf9ypGkFon+jo5KuRa35w4NSLoynh+kF4h04SRzkaFjboePMI95DUniwTqyoCK5waxdP3Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dGTu57Zr; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dGTu57Zr"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-887d902c651so319070b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791903532; x=1792508332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E4vYE1CNRZ/CztX0XDspWeyRLbeGw4BH9y4hZGra0Ns=;
        b=dGTu57Zrf+kQLiIJWhHIva1CW1XkTqt9ka4BJnXjruUE6LtL3LsqyspNmxhzsUq+xs
         YHS7Sy/T1FPDwUj2eFOL1KDMw8dVg6jwk7ylAyz+erqd2yiF2s20ws8LACyxD4YIOx4m
         Jp7aPuzov/EbK6tcaju5UO2SPluILbn8F4zd8HwyBwV8sVSptQnWGmn+u9VBGE1UDmvh
         bMy//59BdiE9T1zqLdVFOy1hSe5EO/NT49OEUHw8P2jbyTKAK/M8Lg7ca1cSFMALEgD6
         8dRxru/kvPFpn/EOXZOzMuL7q4f4VXkTNcKyJ42LALjOrCySSUe8JIb3diUvfCrTiryC
         vMPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791903532; x=1792508332;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E4vYE1CNRZ/CztX0XDspWeyRLbeGw4BH9y4hZGra0Ns=;
        b=DQ05KrK+2l3VAZYxHIulhr1wuDOEbsF0y2ofhnLx2vIA19GMPkMq0H6aZ2vBPxiFey
         +8Ycn85VconCnE3YhKS9ct2tLzIWaMkUt9Dn8NxRxdZt0YFxHiAo3eLTC99NFuh0ppI6
         8PWiFo/6nJP6H64DHpwal+pf7mCtGTzTRZ7SgesMOb0u+f4LexRe8eMfZz62/Z+LYtbd
         cWWXZZkzu+5txess04r1ywhT4VNVp5hsRYTqx5sF5/HeB5/qnmQKmzd5nwXEKQOiffzh
         q1xpW4G4ftQDxWALRRjpwVXF60KpQugHXukRqdXVabCKarqN4xaHkjSu4DVaXZSym0v8
         V31A==
X-Forwarded-Encrypted: i=1; AKwUvBxuePB28ItidKUzamgocz8GqYUrbFiUwGPM2qrx5hRiNALcm1FmVPxYSsTrpGU52YNlcEPoworKTzPfcqw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLhxOgBC7Gx6rutjkJYAPliP/HGLXRhYDDBrYqvpfqDeiuo/dIu
	QhU0RJXi0pXYxJfstZlk4uuqDtQ3joj96HMFpOQM2urfsRSYPlNcexE/nCmm7A==
X-Gm-Gg: AYBFou1g+q59jwG/wclh4smnfX7gLX1yICBz6U/lGrV6wRRGT9mVqhxtDJ4H/oxPV4y
	x9JlVxsyDz39NQfugljytH8y3k+C3aGEfCouVluyiK5cKbUf+sSgg7dwezATG3jIeQPkH8FdzCq
	DcVAEoFQn57L+mtY7Qg8FShT9ZUsBKwRuxlq5Yp7ZkMYEoIMN1XB5FOOrfED2El/Mp2BSI4rsEw
	1tnRL3RcIHr0Wa+YVyvaQ0wFQHZiuuQhN2yo5naE/OXm/hV1z9P3faAB4hEPPvhZz0ESpjT5e8e
	m9SpIZ/Nb+0gN4QKrAv1o6lzXyYpEBfYyNf64C1jBKcwOZcBJewazvwXZZXS7f68dvcM6MXZgor
	sh5eqWEYe7RUX/GVUiFI+WTj5sVc8d48cQRtVc0nbJDsTQdGrn6SbekG9RbZs/YD3EK6OFqASeO
	jSEQCzFtjBb5OCEm/5vxHWZxiG4GP5rF8GggfQU/Ws0OG2hPNeLWD6ZoppZScFapM=
X-Received: by 2002:a05:6a00:4a06:b0:89c:e556:cfed with SMTP id d2e1a72fcca58-89ce556d1a7mr2192597b3a.0.1791903531667;
        Tue, 13 Oct 2026 07:58:51 -0700 (PDT)
Received: from ser8.. ([221.156.231.192])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89a0724a045sm2987330b3a.45.2026.10.13.07.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 07:58:51 -0700 (PDT)
From: DaeMyung Kang <charsyam@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	DaeMyung Kang <charsyam@gmail.com>
Subject: [PATCH 0/2] ntfs: handle block device cache flush in fsync paths
Date: Tue, 13 Oct 2026 23:58:44 +0900
Message-ID: <20261013145846.56415-1-charsyam@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Regular-file fsync currently ignores a block device cache flush failure,
while directory fsync never issues a cache flush. Both can report success
without ensuring that the data and metadata reached stable storage.

The first patch returns and logs flush failures from regular-file fsync.
The second adds a flush to directory fsync and reports its failure. The
syncfs path already handles flush errors.

QEMU blkdebug injected -EIO for flush_to_disk on ntfs-next at
04fb910da2c8. Before these changes, both file and directory fsync
returned success while syncfs returned -EIO. With the respective fixes,
both fsync calls return -EIO. A kretprobe confirmed the flush failures.

DaeMyung Kang (2):
  ntfs: report block device flush failures from fsync
  ntfs: flush the block device when syncing a directory

 fs/ntfs/dir.c  | 2 ++
 fs/ntfs/file.c | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)


base-commit: 04fb910da2c857cdf99a331c576c3e5e7197c6dd
-- 
2.43.0

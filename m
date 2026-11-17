Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794936740;
	b=GgR1DQqcP2OFlNxkSDl8OjAoCTKY1ZdGzR/xLUkdqqwHkYseXbchMfLWcT4mtmjsem4V
	 pfhOeTrxVTd4FvNH4xPyCu97+OSvVtAgYkwP6Cb7OvRZykUQ+4wIkyS4Q/nOmjfkuWYwP
	 5Wl9ROoMtWgta53sEBNG2W5m7Q8wyjqqjcT+Chh4x+xTViO51AqzrpHy3FWFzDUNk3W1O
	 VJXdBSum2mZP0ctmjdTe9JQXcXvtld7IAvvGyHPqbho8TGHicR0qKd+MjOlHQTcTdHEPC
	 wyr1R3mHA/6UKpf+cOhwvH5yI84tFOMYdz9JEBafKwXTafb8fUlfVWXEsuPTl+WNH8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936740;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+7MG30dg71q8VjUv3Kl6iLWy30FheOHfbrKiXTkP1qY=;
	b=IMBeOg343DM20+fKN3CuDIRy5WbTmj0r9/GJfPAVnsIj+0dgD9g1iQHGGjpaOdHcVB4S
	 Scl70odgFL9G7MWruKxg37G91J9W0drMgKi89pGssdIGuTK3QwOD3Per1dieSpo/zZhkj
	 kKYM4A8J/kOZI2tj02zgasUAKtwm85VXS/vvoUbDShk1kICnVaWvs9nziJvWEImYwSp4t
	 9gZ3vLjS/0xpJJbKVSvTvr8Jz3HSfHGHlDR8kR9f4TIcq+66Pei5zC/+NUx/9WsOqspTR
	 FR0SnwctYHAYXYXEOoWSpKTzSvEwU8YrtHWVrnIcFaJxSxLbFWNQRH7hfgi/fWSyHwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=th69VWUE;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36C2606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:32:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D36C2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=th69VWUE
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-380b40319bdso198047eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794936739; x=1795541539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+7MG30dg71q8VjUv3Kl6iLWy30FheOHfbrKiXTkP1qY=;
        b=th69VWUEdtkU9MSclq7EzXZGVeGvm34inXYmxGDENCi3GVGOZUDcq4LjxOLJA9j5ZW
         qKPONBw25aaiT3mOnxcpDS6XHEsDL3OnePqocWe2ijlAiNTOBOgmdX/Vc8z3E2V+7eEs
         2cGd/D4lFMJ8nQefspn5Avh3xNcHrkqUQLzmLWm01CL2MYPFViYh9wZRhXPSmzjBxpCa
         NE158GhK5MvDc8rWwDtWvci9CsImRwzKy/Wy97Y5Bo9e5je+QCa3mfEkzMtJqftcKCvJ
         XFvy6+nnbTJcZw5prTUxGbJm0+TsdBqbkdGwqrhBi0G5LrMc/dhXBGzj5QNj0+7AAXBF
         RdRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936739; x=1795541539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+7MG30dg71q8VjUv3Kl6iLWy30FheOHfbrKiXTkP1qY=;
        b=Yvmg4t/Ah6W/yJ0b3HsWT6ip20dQeldnr2kk870yqzK/z0hJKEiNoBtpP+Kg4Fx828
         XZOMl0YMRvAaZxo9KI9S/rBBeNueibTb1b4qFXE4Yjc4GQowhcY5w40LbIiSgXIqrW+z
         ziIpil+kj7ux+nD7HNvBlA5X39Dgrc6RRS/Y5YDpRXZ3WKyfAoXZ7aC9gzH/z9GYQJD+
         sd4eshUlzlWAANkkqXE4a56+mlgBXL3S4kUWQGTXd9rPvjl7V1YORCEpqMLBVbMzZ+sU
         rKutvjoMtWfw63Osddu8d3rcSBcNbb3RqqfkF39ijr/Vr0Guh97xxljC4aWsfQKgt2MJ
         aUeA==
X-Forwarded-Encrypted: i=1; AL+hErF8F1y6lZtWR+TzC308mE+3lq1U3cnV16+w7anb7l8uNi7tj0AfEJMEqtws4woQ3UkgJRQKKtC8HpGxYbM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9nODY5bZzzsvJjRZOark85j3vU8SZpUCqps6lS0AGjhZpuZp1z
	7cDfs0sEy0mxF0KiFAO0PAYwKTf7vd3lKjhCdx7RXCpR1nbJ5XNkuYKJ
X-Gm-Gg: AYBFou2lbsasK75Vkx/j9+Zvv8UyUBHvKoY9hiWJ53R5zkYKn63y/UEU18JCx03CyuU
	Z+RfRpJA4KZjhM3j5O/XMXe0zn5uEH4pV8CTg1KroH6DNEHfjmVOhfFjW6fQL33uR8mx3vYo9zP
	tukFj+6deaIO+vwkc5PPDiHR9bqLajBHo0bR5Y/OKwH4CpvsMKm21STdR8hLYf9v4Vs2fwCGrw9
	AhAL6SZbslp+fLDAGiuBxcdblXuTJcYiJXyx/XpX7lgi0mlFlzjMmMFebNHjGKvcsVnRwHrz/2i
	WYLEfLTZ9AESg34hG1KxQFwasuv0itwLWhbF9FCxWDChpvpAR8TAjAkt1x4+k/nY3mXk/ucNMnh
	PBmzQ0cJB4kEqV/ve0bqoCeZEgXazc5CzkfE37DwcSO6PUE7KwmUQgkUTasNKsEx82p7DSQMhY0
	IGAjq6Db2+suYn1nUK12e9BHtit9vTIiUF8UrLuU4wCq0DYrPf47uzxdHahvzO4CJUUPbAq1D4a
	YIJJ7CYeyI/3NvYKmAhuvzXlEf6Zkzpj9DbSLK0LXaTjvlQax4pIVPMkkUmuTqhttJ8PVzUprn1
	cJ343cmaKoGJBRHid/5UrzXIIUM6ffOaSd0GM5MRF2E7
X-Received: by 2002:a05:7022:ea8a:b0:168:3243:c937 with SMTP id a92af1059eb24-1b543bb56f2mr276351c88.16.1794936719280;
        Tue, 17 Nov 2026 09:31:59 -0800 (PST)
Received: from MacBook-Pro-8.lan ([27.125.146.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50319d40asm43450247c88.11.2026.11.17.09.31.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 17 Nov 2026 09:31:58 -0800 (PST)
From: Ding Feng <dingf3ng@gmail.com>
To: viro@zeniv.linux.org.uk,
	brauner@kernel.org
Cc: jack@suse.cz,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dlemoal@kernel.org,
	naohiro.aota@wdc.com,
	jth@kernel.org,
	Ding Feng <dingf3ng@gmail.com>,
	Jun-ichi Takimoto <takimoto-j@kba.biglobe.ne.jp>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] fs: ignore RLIMIT_FSIZE above LLONG_MAX in generic_write_check_limits()
Date: Wed, 18 Nov 2026 01:31:28 +0800
Message-ID: <20261117173129.61028-2-dingf3ng@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261117173129.61028-1-dingf3ng@gmail.com>
References: <20261117173129.61028-1-dingf3ng@gmail.com>
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

generic_write_check_limits() stores rlimit(RLIMIT_FSIZE), an unsigned
long, in a loff_t. A soft limit between 2^63 and RLIM_INFINITY becomes
negative there, so "pos >= limit" holds for every position: each write
through generic_write_checks() or copy_file_range() fails with -EFBIG
and raises SIGXFSZ, although no file position can reach such a limit.

Reproducer (bash counts ulimit -f in 1024-byte blocks, so 2^53 blocks
is 2^63 bytes):

  $ bash -c 'ulimit -f 9007199254740991; echo hi > /tmp/f'; echo $?
  0
  $ bash -c 'ulimit -f 9007199254740992; echo hi > /tmp/f'; echo $?
  File size limit exceeded
  153

Before commit 9fd91a90cb98 ("vfs: strengthen checking of file range
inputs to generic_remap_checks") the limit was an unsigned long in
generic_write_checks(), and such limits had no effect.

Keep the limit unsigned and apply it only when it is at most LLONG_MAX.
Smaller limits keep the existing loff_t arithmetic, so their behaviour,
including for negative positions, is unchanged.

Fixes: 9fd91a90cb98 ("vfs: strengthen checking of file range inputs to generic_remap_checks")
Reported-by: Jun-ichi Takimoto <takimoto-j@kba.biglobe.ne.jp>
Closes: https://lore.kernel.org/linux-fsdevel/8F9EB913-3AC3-4D89-9DA3-427029F6D211@kba.biglobe.ne.jp/
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5-5 Frama-C
Signed-off-by: Ding Feng <dingf3ng@gmail.com>
---

Notes:
    Tested on v6.12 (arm64 tinyconfig, QEMU virt, initramfs on ramfs) with
    a static test program that sets the soft RLIMIT_FSIZE, writes 2 bytes
    and copies 10 bytes with copy_file_range():
    
      soft limit            unpatched           patched
      1024, 2^63-1          ok                  ok
      2^63, 2^63+4096,
      2^64-2                EFBIG (both)        ok (both)
      1                     short write, then EFBIG (both kernels)
    
    Also reproduced on 6.10.14 (arm64) with write(), pwrite() and
    copy_file_range() on tmpfs and overlayfs. Compile-tested for x86_64
    defconfig with clang; not run on x86_64.

 fs/read_write.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/fs/read_write.c b/fs/read_write.c
index b15522c..18a217d 100644
--- a/fs/read_write.c
+++ b/fs/read_write.c
@@ -1693,14 +1693,15 @@ int generic_write_check_limits(struct file *file, loff_t pos, loff_t *count)
 {
 	struct inode *inode = file->f_mapping->host;
 	loff_t max_size = inode->i_sb->s_maxbytes;
-	loff_t limit = rlimit(RLIMIT_FSIZE);
+	unsigned long limit = rlimit(RLIMIT_FSIZE);
 
-	if (limit != RLIM_INFINITY) {
-		if (pos >= limit) {
+	/* No file position reaches a limit above LLONG_MAX. */
+	if (limit != RLIM_INFINITY && limit <= LLONG_MAX) {
+		if (pos >= (loff_t)limit) {
 			send_sig(SIGXFSZ, current, 0);
 			return -EFBIG;
 		}
-		*count = min(*count, limit - pos);
+		*count = min(*count, (loff_t)limit - pos);
 	}
 
 	if (!(file->f_flags & O_LARGEFILE))
-- 
2.55.0


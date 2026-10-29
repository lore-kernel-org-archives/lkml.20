Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283163;
	b=oItLA5Vb9gT8WunGD09EKCLDXeYdD5YhGXvet4jYv3pKT54IVBcevO10f+DQbvc1m158
	 AkJSVlAu0FpBNaSEXvNvunogSqQjdhCcikNrtU2AOz8Vf2mAS6Q6/THSV/F9lt/GHmSyK
	 Rzf40W/Oahm+q2ehrc3hZsFHcH/3hl8p/m5uTVou9g01kadaHo0OMV7GeR3aVc3SgZHDq
	 ubgJ0HrCxUQljlbfRW+1bGPahq13h2M3e8/h+z9eemSQ7Sv4pmLSJIqejg3KiprgBjp8M
	 HegGR9vJJPOnzeFEgZAXRXxBHkwCl2YCTW1RCfErqnNm6nz08lXxgNJ2OypPM+6YHIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283163;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ugO9Kth5t8s7Fphk46Xo5ddbEmG6KSdUT5+AGSNMycY=;
	b=gK+Kr0FDPehi0u8sNd+2lTHxnNBqYjrze3HpqyQh4yOz4sYKFnjGTbOfObJ2P4e4Olek
	 YeF/c3yMoCPGsTcUp/cJJlfeJjhWWmeJYvgzNaplsiKHokppWR1mVaz2xTo/4j/HAzScz
	 yrE5o550Ve/2F3/ilZcxjoZ9wkwrULdzjarUNaZSnnUAZcdOtF32CZcVguT91zGd/DUTY
	 YuKjq9dFcgbQ2SsCFcO9j5jtu83vs6BzoEGTivc3mjhCWn11Wvkl5df7QjNG+5zDnOBuv
	 dhdMOoySnRovAQHshNdQETXgTXhlbOINA9iZMo6vB3YYOOUJ15CtWThLiTkVSsS/npA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rsYPJ+dW;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C69606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:12:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93C69606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rsYPJ+dW
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-156cbe59622so2246325c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793283162; x=1793887962; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ugO9Kth5t8s7Fphk46Xo5ddbEmG6KSdUT5+AGSNMycY=;
        b=rsYPJ+dWvfE9hULcrCx5P5nwSB1FWDWlVyEX1LPDC+Pcz261VAvGW5vYXrq7H2aMas
         tnD7MrDMYnhV1k5ZZeMypHaX1rdsHJawevsLKNVqMcs7YX4qfws02uTLpW0PzxbcLiot
         zV7Xjb+sL/iAbC6apTnitAw4Ktli9Nh4IXO9Xl5p2qOt0WD70/iTqEbQapr2coXoi/bO
         wBu3fsneuUGOnzP+X61b7nOSojH5GclQbq5nsW+KNIaKnSpRj7QnCzVWReqIbsb21PeI
         xs84S4BYfBgc1g5nf0iRf3/oJ/+94rIjnl5CGMD1CUEx4jriiybwMID5kUi3iYad5b+b
         Zokw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793283162; x=1793887962;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ugO9Kth5t8s7Fphk46Xo5ddbEmG6KSdUT5+AGSNMycY=;
        b=tcQP13+42DyvBAILf1KDERw5NF/Mww83MgdLiPlTG0K84Lnx7yDW6StrZnESP6rggn
         jUR8yfxEQQveJCUqpV7gOZ449olJMBZ/wI5x0G+m4tf057SBNjzy/4r7Ba6NcPjfyEdb
         ZbQQ2qIo1oQQE0NJw7uIAhwJeOPrxO0EmWQhEEH5WSgXjDScUoYlwl/L3DTB4NuCuMBn
         3MF6/nqJLNS/opsWBMW1/6JrNfSLFyrnDEHl/0WU1kWXKqokrQxBV0KNu9uhU8h6WtJ1
         7IoTtokjDxUY+/IfQwowu8xw1ZbKQ7wAr3P4qtvPR6GPFt/+FBKCbrL1lhwWFAcfrbT0
         EeAQ==
X-Gm-Message-State: AFq9FYINOLamszAfJSYPxvZiUXx1s/FZ5iDnWOQnFGvmZ9XpnlVd/W7u
	alMhoKLWBPdlo9cdzbkL6dz6fRd156KM9Wkl1HqutKmepY5Q1taYWN9C
X-Gm-Gg: AYBFou19X2H2sf8AEM2H9+wpGzDl6xSdJC5m7BXokeYdnbBz5gfXiBbqcQxpw3vd0k+
	WyOs3DKEzq8pCIw2i7Dl8LUsyR4KC9oNz1qsMHpeFnjgnNUpiZd3vn7AiJaVFEOs4SnY4SbSnoR
	30HQCRjAcnpwjrc9+nS+FlGawuIsydIR9Lpn7pHuUYAnOQuerODvwqxUYBa0IS4iCKZE7xJaU9x
	vJ9wjBcIg3vZy6+Ed3w2R/d/KaTLnkA9O5AqGOItOSxtJ/DVQqKkQp8vhscXisJ+x3tB0ni4fKe
	J/+RR4J0AXYJOJuBeebIfzAPlZXfH49sMRDjYUuEbKNZONeyHZo3CoE3p510RW9ewg5eX6AV6es
	yGtxFqzP2BLFByHP7dpfszTd7Veh+XO7UihEqdZx/6Qja9hFeM/OveGhTNf3n0QvRWrTSYBl4i/
	Zp2H506A1/eWh1HytPdyPSsKKpYQakzavLsjLwzrUOL5OD4evsilZbpnMNoLlMV732+GLj/WSav
	rVTmV6/AzvwwkdBXyY0oWgsbVt7JQWN7kKZIbNumQEp3oMoqu8miTNXpL27Oc0m+lN8Z9VCuf9u
	6hASLBlOJAeu51NZ+nBDbe1777DjO1TDlfDrYCSbmzd4ShrjVsLEFQ==
X-Received: by 2002:a05:701b:4203:10b0:143:3c9f:10a6 with SMTP id a92af1059eb24-1a6c9af1e26mr7955968c88.4.1793283161611;
        Thu, 29 Oct 2026 07:12:41 -0700 (PDT)
Received: from [127.0.1.1] (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75d76814bsm15197319c88.10.2026.10.29.07.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 07:12:40 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Kees Cook <kees@kernel.org>, Joel Granados <joel.granados@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject:
 [PATCH] fs/proc: fix the write length returned by proc_sys_call_handler()
Date: Thu, 29 Oct 2026 07:12:20 -0700
Message-ID: <179328314073.648427.7892850166511253762@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

proc_sys_call_handler() reads the write length from iov_iter_count() and
copies that many bytes from the iterator into kbuf.  A cgroup/sysctl BPF
program can replace the new value through bpf_sysctl_set_new_value() and
update count to the length of the replacement value.  The handler then
returns that adjusted count as the number of bytes written, even though
the iterator originally held a different number of bytes.

If the replacement value is longer than the original input, ->write_iter()
reports more bytes than the iterator held.  splice(2) passes that value to
iter_file_splice_write(), which subtracts it from the pipe length and
walks past the pipe head:

  Splice Exceeded! ret=7 tot=1 left=0
  Oops: general protection fault
  RIP: 0010:iter_file_splice_write+0xb6f/0x1170

The write path consumes at most the original iterator length in
copy_from_iter_full() before the BPF hook runs.  Return the smaller of the
adjusted and original counts on the write path, so an expanded BPF value
cannot exceed the iterator while a handler that reports a shorter parsed
length still produces a short write.  The read path keeps using the
adjusted count for copy_to_iter().

Fixes: 4e63acdff864 ("bpf: Introduce bpf_sysctl_{get,set}_new_value helpers")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
---
 fs/proc/proc_sysctl.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/proc/proc_sysctl.c b/fs/proc/proc_sysctl.c
index 6c0859c..eeebf81 100644
--- a/fs/proc/proc_sysctl.c
+++ b/fs/proc/proc_sysctl.c
@@ -557,6 +557,8 @@ static ssize_t proc_sys_call_handler(struct kiocb *iocb, struct iov_iter *iter,
 	struct ctl_table_header *head = grab_header(inode);
 	const struct ctl_table *table = PROC_I(inode)->sysctl_entry;
 	size_t count = iov_iter_count(iter);
+	/* ->write_iter() must never report more than the iterator held */
+	size_t orig_count = count;
 	char *kbuf;
 	ssize_t error;
 
@@ -607,7 +609,8 @@ static ssize_t proc_sys_call_handler(struct kiocb *iocb, struct iov_iter *iter,
 			goto out_free_buf;
 	}
 
-	error = count;
+	/* the write path consumed at most the original iterator length */
+	error = write ? min(count, orig_count) : count;
 out_free_buf:
 	kvfree(kbuf);
 out:
-- 
2.34.1


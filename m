Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892128;
	b=JjC1V6wbeN2zrQjEZcUOZVo4QqZ7quvZpP0UMYLr/N4XGt4396Ye6vWXv8Ku9EFlYISl
	 xlEunomSJHDrbLgHnW9TvbmqE31n0092RUryjd1eQHtcFanl3zFbnK34n/uBQnXbj43cq
	 6h6cLTK0C/m42plDSlA3Eej/R601ixh99Tq7PtxQvqrncwgoVCQu0iCGtReF2gpW5mZof
	 5LXFp6uKo0NiGbBa87F3xrk83301IMIcuXtADD7ibQgLbBwMBYiMXdEn3CSEvzfZaPH57
	 7+bWSJ3g89G2Il8a+Gw2fUFGoCK7Ks+aqhPtPDVwCt2gejelJkc2B7BXKETi3s4H9yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=vj63xyhuZ3SVCbccahbLO+6+SjXllROfEnHLRARVSqI=;
	b=lZcx/MQhwGnJp7diBsLOvOYYirstiyf5boGCqG2FIE5Uoj32oDBR6pRc2IF3U/OoSyih
	 /F8m0CjzoY7fzvsodSBKgputc4L6OnFpA4UKgvm1cK2NDMc3CiEdoA3aAT/bh7zPAvejF
	 fzFLKqK19Z+cba50vZF9XsA946AmK4/OcVzYtFjd5TBCtvvN10HXxv3FgrIfIOH+Y+E+j
	 qmnL6b0GfEBcM1ruaXZQhxWSr46VINNEQq0Tx4OewQTln/NoMJqWgEyip3pQDv8KUDHzb
	 9EXDG7m+6iZsFNkjSIn7IeEkN537OYevK0W412OGoJUusDvwTUh9xVCtjI5qjlUrA5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=toxicpanda.com;
	spf=pass smtp.mailfrom=toxicpanda.com;
	dkim=pass header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=hk3vz+8R;
	arc=none smtp.remote-ip=209.85.219.44
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE52606A331
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:22:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EE52606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=toxicpanda.com header.i=@toxicpanda.com header.a=rsa-sha256 header.s=google header.b=hk3vz+8R
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-91e8938fd01so17054706d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1793892126; x=1794496926; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vj63xyhuZ3SVCbccahbLO+6+SjXllROfEnHLRARVSqI=;
        b=hk3vz+8RnfObq5Pv1ZZoHlBChlbX0ElAKLkc7I/F1uNaVSGwk04qb8mU8kkz9ae1B3
         ZHl4MP4vgohtkLAxxffdPymLme4JOws7ZMBkAwAeQiey51ZwbS/cjBgbbyGoCDircdKe
         /MfmY4IAj6RD8I5WliWVt6si3DxXCeejhuAkN0pDhN/yxRtDoeSxi/fgu8pcG8xtLmLW
         mq4mmI7OdLgsEf6CvjcfNLsUWf+xhFo+osTBsJQzpJaSz9lQqpR0jNW2ZmPpETggOgrh
         4i8vgNUpdzm2JS1pmvT29GPHlx9m4qxHmnaoPqg2odzy+D5TJhcOynVPM5H/DgE1/bqw
         GTfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793892126; x=1794496926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vj63xyhuZ3SVCbccahbLO+6+SjXllROfEnHLRARVSqI=;
        b=Csyb0j7NuHjMYiYe9qzZ+TD5mXTGNs0TAX+yFAuOeYtvJG7j4V2hK613usLCjjbyoC
         Ensgvlx0HB+gMK1kzHpad2P2IlRS0yMsjC+lScoNddHs0vt0CFLNdkYtacnxdBGv0lUd
         q+6QKb64MabY4U1HtgRtDW2CB2BEixUSjFxRBtZa5OHTVGWuPxscsRkpz1OHQ2MfzcIn
         DOCkQpQgGMVYRMthJ2QKXlpsJHN1phuzY38QyArBKq4hj8WxKu7NFT8gkqzHXaPJ0irG
         XCd9k1HHaPwyAwZVn6KI76RFWYqQgsBc5Ku1BHu4gnjXTzNx63T581w5AbwdVuVFMt9b
         e6Cw==
X-Forwarded-Encrypted: i=1; AKwUvBxf01w0uN4jvDYBMy6FsOJ9f1cBXV+CVNduKLMmsaAaoEQr/wfuarwCF2NLQFEf3zEQ0piGPIXyCQtPvSw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uJdEfrYQyXNAiH+UTuNepsSGjf8gy8rtQO/UudFMCx4ZBlbbT
	9tFbuzATJLthqsno8K8BimsGyrL9UbKhq4hIZmWw21pueD1u9wJjV2VzxklE5fOcs5Q=
X-Gm-Gg: AYBFou12RH5YiBh5so61/7GQ+f6a6eBwm3wYyV8DuXD0wnJgYjW32I1c+1smjwQ0ndA
	LK+ohTIupe8DBnOuneezj68FYC5GjFA3iRxiilapP3ytTapmFLWXE+1hWAXceZkc6//dsqXYlVF
	8TuuFyqBpmm3obSFFMH25ZHDzib8r5R7NIayys7l4kod4T4q3J78OCEaLj99V52dJz2keU5iGpL
	0A8WqerGK8MsAl0fqWMTxC/qbwoF95cpAgW38/KUjLF/4Lmy+DvEf0N2+AzkZ7JYciBpeocZmSF
	QKhjtcZGs98i+IAOm5K/Cb+x0G6FheUl5C1hZrW2iViycukdGkYt0hvMHprVGPB3mcPWSUpOJua
	pi7Ef/2kBdIJbjBzngd0eaqhS50DN/zj+hgDOWesa+sQ9z4u/ShGNeWEDqtr3aNTb4S7WvCAcGE
	brunuE+6MnHDT9EhJKcLZWdmipjw9s9IZORzKj+cqmXKlA+R7F8DvQZ9aeaEBHZTgedmeb/hbVb
	ajSFCZxscHYRTzHBCv+EdFBcFNWlN56Og8gNB1t6T5aWj5lZfV3ifdT7xD5ItHZj7dfQbv7LkL8
	0vOrieA9gzp13qZPUjPcOPwvmDGk2XzEktVShxRilNlG5A==
X-Received: by 2002:a05:620a:1d0a:b0:93b:fb3c:2d09 with SMTP id af79cd13be357-944217bfdc4mr3145520385a.66.1793892126628;
        Thu, 05 Nov 2026 07:22:06 -0800 (PST)
Received: from toxicpanda.com ([153.61.196.245])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d47c6f5esm481020585a.16.2026.11.05.07.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:22:06 -0800 (PST)
From: Josef Bacik <josef@toxicpanda.com>
Date: Thu, 05 Nov 2026 15:02:51 +0000
Subject: [PATCH RFC v3 59/90] ptrace: refuse PTRACE_TRACEME across cells
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-b4-cells-v3-59-bc9095937a84@toxicpanda.com>
References: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
In-Reply-To: <20261105-b4-cells-v3-0-bc9095937a84@toxicpanda.com>
To: Christian Brauner <brauner@kernel.org>, 
 James Bottomley <James.Bottomley@HansenPartnership.com>, 
 Andrew Halaney <andrew@amutable.com>, Jeremy Bingham <jbingham@gmail.com>, 
 Tahera Fahimi <taherafahimi@linux.microsoft.com>, 
 Serge Hallyn <sergeh@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1793890935; l=1373;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=00kMzkixkwO1y9l5s18VmaAqC40wDdqwsB124NYHwSQ=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QORpRdpq0dXNEhf4GcQiv93YcGkFIz6GZ2Kg7DN1VWvJrL/dYNQ/C0mMbGKkSbRqj/ymkuqjY9T
 s3DUVY4kjBw0=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

The parent of a task that was spawned into a cell is the spawner, which is
outside of the cell. PTRACE_TRACEME would turn the spawner into a tracer
without its consent.

A traced task is not reaped automatically. It would remain a zombie, and
zap_pid_ns_processes() would wait for it. A hostile cell could use that to
prevent itself from ever being reported dead.

Refuse PTRACE_TRACEME if the parent is not in the same cell.

Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 kernel/ptrace.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/kernel/ptrace.c b/kernel/ptrace.c
index c30e15d39c41..c6115922ea2e 100644
--- a/kernel/ptrace.c
+++ b/kernel/ptrace.c
@@ -508,8 +508,20 @@ static int ptrace_attach(struct task_struct *task, long request,
 static int ptrace_traceme(void)
 {
 	int ret = -EPERM;
+	bool same;
 
 	write_lock_irq(&tasklist_lock);
+	/*
+	 * The parent of a task that was spawned into a cell is outside of it,
+	 * never asked to be a tracer and will not behave like one.
+	 */
+	rcu_read_lock();
+	same = cell_same(current_cred(), __task_cred(current->real_parent));
+	rcu_read_unlock();
+	if (!same) {
+		write_unlock_irq(&tasklist_lock);
+		return -EPERM;
+	}
 	/* Are we already being traced? */
 	if (!current->ptrace) {
 		ret = security_ptrace_traceme(current->parent);

-- 
2.55.0


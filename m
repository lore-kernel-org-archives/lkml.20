Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793732803;
	b=ec4kej1cWOU5RLbZxglWgz37rL7cejUrVaYsy3Ol7EGo7vP6E3wfPXktArTL54py/0BJ
	 oF7rLfT3QXtofMBVkSrx1Ljktuj8ian4/YdxDFD4rXdbnSbnNOUw0Wxnql3oGcKNhrvZU
	 AKuTa90/16KK7y72VNvTlqpuErE9HXvNzmNvqgdnoZVYyInI2qfqFtb8ixN18wfF5w5fS
	 nxNjYs5sOXPD2946A+POeBVP3Q73Eq/EyusyXP5Ts9fWuSAFKzpcCo1KrFieysNo2XMP+
	 BnUf/1FX95Qnrdf6SuApdeJL21lb4evovkIZEpSNL7RPkrvQgvg0hieaqY/J4/hb32g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793732803;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xnhb546EvTjBiof0WQT3D0GzQYbD7f9E7QPwpqthPc0=;
	b=W1zSOKX35NBgOj6Rdx1BKCfe3URq0TSSD6Ytsgsu8cN15XYt4dRsbNzXF9jh1RxyX7C/
	 eBBttLQ2Jy9386LoSxh/lQ3k/WCctc9u16oTFK60G5+C+/fdkNMoid63RgZSU6JJpWTsQ
	 Lb5mN9MqHPm8wOwbwphHNpWkwK5rTF3aEttaTTNWfy0t7Rt3+sjAmWDjsDCrGY18pe2g5
	 Bk37Shr3o4oZR+CB4mNsOdVRJBDjQ1HoDaLxAwYFVRu1AiLsK4vGlOeYBQM7O5isQUC6x
	 cZ/mxNutRNM+V5NHW+2wIw6KeQwtwd7QhqOHow5qZMk6/1cw1i7Ql4pRnXWLFHfxxFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IFcWmSzn;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC72606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:06:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DC72606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IFcWmSzn
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3535a54bed9so6748081eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793732802; x=1794337602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xnhb546EvTjBiof0WQT3D0GzQYbD7f9E7QPwpqthPc0=;
        b=IFcWmSznmlF1houPj1jWOUK4c8slHpSDEh02G7flWSjdRLzgeAssjng+o6yu4rRlOQ
         viAxaYbNIxL7nC+iioJi4n5rsFC9arOeCnD3EBkml86bzqhDwg8h3n0phu1V3MACjGIe
         QwySPA+/1tAej1B1FqBzqSzH+J/wDXydeqfAv54Rcs8HPHi0jLVHCGS2mwtjj19DRvc8
         gswOczoxpXtnCS7LNhZzdJOwtHw4cN196oykGNYhGg+M8rF5v3dfTKhFp9dh34xEEfEg
         BJ0ZO3cFpkwXRce9scokAXW1z4N+o3JF83JngnLbVZpt7vLmp5+wPMAih975KUImu/ah
         ckyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793732802; x=1794337602;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xnhb546EvTjBiof0WQT3D0GzQYbD7f9E7QPwpqthPc0=;
        b=FytCq7uVm/gby4EZTbGa+907xYtgi040bxyp1puKcL64ModrFrYGN0EnNdyaaV/LNr
         YcMse0E4z8uaYPIHb/TVzhH6ZcJIvE+Fy5vacB0Nea1FnqaKQTFgo4rjGDVrChZ+4GJg
         PqKTronpWG3tFeVxXx/uFf0EThOo3BGkjSlQVWAGVB8TNhF6CKfQqE50Wbr0Ng0Vq1di
         AtnB+15Kh8BrDtJcUSq1JybHB2UNHwE5nNGcQjLc8xJj0g4swXUXt8OTB1LXyfgOlFsB
         d6DADF8AE9dhCKBUiJaM/oFWzciJlvLGBM3wm/Y8rtvQM0iQ/JHTtegN7saa7gxiEAxM
         +KpQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOMX+CJmtIHZBLF0ZdPec/vlpn4WqwOn8kUBZpzDVYT0Kibx+m5JuF06VyPTUlJheMbJGqOx5oVsMevhg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Q1ZzJ4AHEw6gWjH5LIZvCa8iE2cnaI8nSZgTAdE9qbRGntEiD
	eUZzGkVA1tJfKPbJ40vMnzIpwAR+pS8YaklXUi/BgCRhzPAzgsGnWZ2n
X-Gm-Gg: AYBFou0MoN3fnUrQh+IpkPI95O2cAwx0Wz+o1+gwRrSc3p04ctTEWEhumWuyNf2EISd
	JtIBQdI7X8/YH9uji6Vt1Ezb7ps6qw7MrL5NFeHWz5iOlSmcwcuhtc4vLC0rfME519RRIckBYCU
	p5yusgyiDnKvSlbxCO7Ud03Xy4IdGB0d5YTpFUD6C9RAtWLzpvSdjkuLjbOeAXuFRCfg1t4Uz1h
	MRZfqW5ntnFWLBvKwL/MBKBR6YQTObrL9B6bId2sLRqmmvJ+BtVcTxg6lrEit3MwJZUWuDeTSVD
	K2GbPPrEKP3+OM2clC7awi+23jwxP74kjZg8NiIWvVyIxhvWI2EOBthYsguofwQ4KoYBJVJenJA
	tlKL9oHlYsaaTMFhke5hbsJBbxbkoqhcBp7op2Gh9OU+PgaZaTNbe+zCD8a4Cii856hKrJLKb0/
	kD7DCCgHauoiRjNnf7MGMk9EgN3mA8MpBzvpVjy4+dFyUDhnl1JXtkIrMJnlBo28wy/5KXOZeOu
	jDB3ueDG10tOHdCkflFIedHy6fylOaPfCM4PfTcStsugEE8+lug8h8EeTELq0bugEi0qX/eqJMF
	gjKMOPHKwnJ9eNmYhhfPr1ygXFYDsCKki2QRt3Bklm34sYaO6TdEluZZ
X-Received: by 2002:a05:693c:20c2:10b0:369:f9b6:f486 with SMTP id 5a478bee46e88-36a4260db8cmr22262699eec.41.1793732802065;
        Tue, 03 Nov 2026 11:06:42 -0800 (PST)
Received: from bridge.. (deps54-26.deps.ufsc.br. [150.162.54.26])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d3754sm175927eec.14.2026.11.03.11.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:06:41 -0800 (PST)
From: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
To: Daniel Thompson <danielt@kernel.org>,
	Douglas Anderson <dianders@chromium.org>
Cc: Jason Wessel <jason.wessel@windriver.com>,
	kgdb-bugreport@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] kgdb: Fix buffer overflow in the qfThreadInfo packet handler
Date: Tue,  3 Nov 2026 16:06:22 -0300
Message-ID: <20261103190622.925741-1-christian.aurichzm@gmail.com>
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

gdb_cmd_query() answers qfThreadInfo with a thread ID and a comma for
every online CPU, 9 bytes each, followed by the first page of tasks.
Only the tasks are paged, KGDB_MAX_THREAD_QUERY at a time, so the CPU
entries overrun remcom_out_buffer[BUFMAX] once there are enough CPUs.
On x86, where BUFMAX is 1024, a typical boot hits this from 109 online
CPUs (222 on arm64 and riscv), and GDB sends qfThreadInfo as soon as it
connects:

  BUG: KASAN: global-out-of-bounds in pack_threadid+0x2a8/0x2e0
  Write of size 1 at addr ffffffff86eecc20 by task swapper/0/1
  ...
  The buggy address belongs to the variable:
   remcom_out_buffer+0x400/0x420

Page the CPU entries together with the tasks, so no reply holds more
than KGDB_MAX_THREAD_QUERY threads. The CPUs still come first, which
scripts/gdb relies on to detect KGDB.

Fixes: 25fc99991383 ("kgdb: fix gdb serial thread queries")
Cc: stable@vger.kernel.org
Signed-off-by: Christian Aurich Zanettini Martins <christian.aurichzm@gmail.com>
---

Notes:
    Tested in QEMU with KASAN and GDB 15.1. Unpatched, connecting GDB to
    a 109-CPU guest gives the report above; patched, 109, 128 and 255 CPUs
    return the full thread list with no report.
    
    Based on v7.4-rc1.

 kernel/debug/gdbstub.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/kernel/debug/gdbstub.c b/kernel/debug/gdbstub.c
index fc6a7a8c1f6e..02f27e70993c 100644
--- a/kernel/debug/gdbstub.c
+++ b/kernel/debug/gdbstub.c
@@ -752,15 +752,20 @@ static void gdb_cmd_query(struct kgdb_state *ks)
 		i = 0;
 		remcom_out_buffer[0] = 'm';
 		ptr = remcom_out_buffer + 1;
-		if (remcom_in_buffer[1] == 'f') {
-			/* Each cpu is a shadow thread */
-			for_each_online_cpu(cpu) {
-				ks->thr_query = 0;
+		if (remcom_in_buffer[1] == 'f')
+			ks->thr_query = 0;
+
+		/* Each cpu is a shadow thread */
+		for_each_online_cpu(cpu) {
+			if (i >= ks->thr_query && !finished) {
 				int_to_threadref(thref, -cpu - 2);
 				ptr = pack_threadid(ptr, thref);
 				*(ptr++) = ',';
-				i++;
+				ks->thr_query++;
+				if (ks->thr_query % KGDB_MAX_THREAD_QUERY == 0)
+					finished = 1;
 			}
+			i++;
 		}
 
 		for_each_process_thread(g, p) {
-- 
2.43.0


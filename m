Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9C444F564
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 06:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792391765; cv=none; b=r70A+zHLx2+Sc2Qw/KYWsPQXqo2/SS+6gBK1kta/q9x9YCp1jUfSf7kKkPvnfPtz49YSVjI/mzxagtWqmoUc09cLiI+cjT8CvO+dzhbN1yNCsx0NoCixda3CGu8Fw3Ds2fwQiPzhYRd3p6pDXUTCKQcisp9FcEMIoymgig8phkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792391765; c=relaxed/simple;
	bh=PX9zZj4iTg9WzoWwoCz6MvS21cdwDV4voOBVLw9O6pg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hnCzqvC9vFFb2su1uVPONgX3M6wGF1GVik6mIruZ2/gKrL0oa1N+E9gxvAmmy70Fw2zX24+n/7k4D3oh2goF1NU9bhm40eDtsQkkr5iZgGJN4jvf1ucwNbGBzmL4Q2yz4Zs6o1xo4TRFMR6myEci6SVbhHI51Ayi4NC+XVIFcrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cYVYgvkf; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cYVYgvkf"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-17bc533fda3so1893829c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 23:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792391762; x=1792996562; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yFQatoeAsD0uy3HEOPLZwlpYB4M5Dzpm+OdX5z+s5s4=;
        b=cYVYgvkfPdscFvhdjQ+ja9tAa2jhRirfYFvFiVJeT83Kc6Z6KMDe8MBRAL6p8YZiBU
         RcX0qxIGWCiGtDnGcOJnH54rSUe579OI3mcCq6EN+5EXujv7kOLpW6PPmiJDZN0ISqo5
         Bgms6d68dCbj9TacB8ALnDQCzlVXcGdjBSJSKzkW2q7aK+MRNc+l+A/DNoJljKvsyKsm
         9NlKnJwLsJr500KvPCuyRjxP0jo5hixWn3pLt80t2U8FBpvTDOtxfgrnJMjQGkwQpxDo
         /zW0Mu09+NcFayZVb16OLZtXLOYoMJXOJ2K/4VBIgp58Lhkr4BDgUgo6OmPSTXtXrBih
         SL2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792391762; x=1792996562;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yFQatoeAsD0uy3HEOPLZwlpYB4M5Dzpm+OdX5z+s5s4=;
        b=XC2CrM+ZT6R15M81Ey8j4jvg8rwSBATY3+myztwySfm14z+UTAnbBX2yY9ZtpSdHM2
         /mPPqTxFDR69otU70Geg0cjY36dpaesMgqQWJUtDXb0s6OtDlRqdvLseNpr+d1CmEnYQ
         8/KXy5ZZip+DpIgEgIs3v0+hGuei7IJTE7Zxfh9SfMsKxBvkWV7xUXbtFs7Q14f6K1/z
         tsXY6060984c1JfYISijbNcSBOtbobu+Ip09RhE3lb1Z/vvR76mGWru9P8p8giabkC56
         zr8Bvh0iDhJLOHFmcbZpFHhjpAuEOFFIyI1kGr51q9UMlKpZI3AzRLjc9SoZnAION16A
         546Q==
X-Forwarded-Encrypted: i=1; AKwUvBz/Y/OdHQWpb/Ifpbk4JgGYc0UsbdVihELJjkoeSRQQj+cjd8sT0VAJ27PkFWk9lwKjHnptFusMUtgBa+Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6b3DuDYEgBvAo3j0cGQcwURCN3GPPEL7Qhs/4ikr0hxLqANpt
	6XbFWGojFskHihJTxtqpHu2t4Y1b69A788NZggM3sFPHEDstuf6Kb0cL
X-Gm-Gg: AYBFou2HPIWs4L0YZ3kXAq4vAjaMsfWUzPHaYXPqe2cFB6obQgAB5fCWQO+MmrY3RRH
	ZIOARSz0YgLN3HpGdih3/KCY9dCYYie8ofA9iMkdYX5LDCMtj0hgonxcKuc+VFrbhcD636qU8Ip
	OaPjik4iDEUFJxzj2aBECw5KWFRPPI3HBtpFgVQN9TT24wkBmh8Vl92bdirINB2BalYYIhhQjGJ
	9qnhJgBy7C0IWz9nJTwXZTlX9GZFYyN+ykQFnWJGgmhGfonH+o1zZ7ajxHpBozXwT+Un6Q2yzhg
	3biuBpTQM5FpOakNupVdjFX68j9DJ6MeyZC1i4Rx8F2dvxjRioTYhfwEdNdOHoyZGH+uptvvytB
	dHqgJ1IxcMPuPF98+TuB8G8Pkk4FvOFTFRpOOwASupERd8N93XzyI9ap9Az8mCKTtuzRIPi3YhM
	5Lmxa4VyPUA4mepp+95CzYNesZj/1gLyETfK/cTuK3laOAAq+Fj/2aVTp27misAHaO2A==
X-Received: by 2002:a05:701b:458e:10b0:15d:d124:b7c7 with SMTP id a92af1059eb24-185120a8bbfmr9772701c88.10.1792391762455;
        Sun, 18 Oct 2026 23:36:02 -0700 (PDT)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f5a13sm30785476c88.12.2026.10.18.23.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 23:36:01 -0700 (PDT)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Mon, 19 Oct 2026 14:35:55 +0800
Subject: [PATCH bpf-next v2] selftests/bpf: Time tc_edt from its first
 packet with data
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-selftests-bpf-tc-edt-serial-v2-1-41c3813e7916@gmail.com>
X-B4-Tracking: v=1; b=H4sIAEq61WoC/42NTQqDMBBGryKz7pQkGK1d9R7FRRonGvCPTAgW8
 e6NnqDLx/t43w5MwRPDs9ghUPLslzmDuhVgBzP3hL7LDEqoSgrRINPoInFk/KwOo0XqIp4RM2J
 jK21cLd2j1JALayDnt6v+hnM+0xahzWbwHJfwvW6TvPxfD0miRFcrEqV2qqz0q5+MH+92maA9j
 uMHtgQgdNAAAAA=
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>, 
 =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

tc_edt sends 1MB over a TCP connection that a BPF program shapes with
EDT, and checks that the rate it measures is within 2% of the target
rate. The transfer takes about 200ms, so the margin is about 4ms.

The measurement starts before send_recv_data(), which first creates the
sender thread and accepts the connection. On a KASAN kernel, x86_64 VM
with 32 vCPUs, that takes 0.7ms when idle and up to 4.7ms with all
CPUs busy, while the BPF program spreads the data over 200.08ms in the
median. The test also fails without test_progs -j where everything runs
slower, e.g. on s390x and with ASAN in BPF CI.

Have the BPF program note when the first packet with data goes out, and
start the measurement there.

tc_edt run 100 times on the same VM, idle and with 32 busy loops in the
background, before and after this patch:

                 before                after
  idle           0 of 100 failed       0 of 100 failed
  busy loops     3 of 100 failed       0 of 100 failed

Fixes: b0f82e7ab6fb ("selftests/bpf: integrate test_tc_edt into test_progs")
Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
V1 -> V2:
- Start the measurement at the first packet with data instead of running
  tc_edt serially, as it also fails without -j (Alexei)
- Add before/after data

v1: https://lore.kernel.org/r/20261009-selftests-bpf-tc-edt-serial-v1-1-f72e045f2465@gmail.com
---
 tools/testing/selftests/bpf/prog_tests/test_tc_edt.c | 13 ++++++++++---
 tools/testing/selftests/bpf/progs/test_tc_edt.c      | 13 ++++++++++---
 2 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/test_tc_edt.c b/tools/testing/selftests/bpf/prog_tests/test_tc_edt.c
index 462512fb191f1..1391978a3e309 100644
--- a/tools/testing/selftests/bpf/prog_tests/test_tc_edt.c
+++ b/tools/testing/selftests/bpf/prog_tests/test_tc_edt.c
@@ -90,7 +90,7 @@ static void cleanup(void)
 	remove_netns(SERVER_NS);
 }
 
-static void run_test(void)
+static void run_test(struct test_tc_edt *skel)
 {
 	int server_fd, client_fd, err;
 	double rate_mbps, rate_error;
@@ -113,12 +113,19 @@ static void run_test(void)
 	if (!ASSERT_OK_FD(client_fd, "connect client"))
 		return;
 
-	ts_start = get_time_ns();
 	err = send_recv_data(server_fd, client_fd, TX_BYTES_COUNT);
 	ts_end = get_time_ns();
 	close_netns(nstoken);
 	ASSERT_OK(err, "send_recv_data");
 
+	/*
+	 * Start from the first packet with data rather than before
+	 * send_recv_data(), which also sets up the sender.
+	 */
+	ts_start = skel->bss->tx_start_ns;
+	if (!ASSERT_GT(ts_start, 0, "tx_start_ns"))
+		return;
+
 	rate_mbps = TX_BYTES_COUNT / ((ts_end - ts_start) / 1000.0);
 	rate_error =
 		fabs((rate_mbps - TARGET_RATE_MBPS) * 100.0 / TARGET_RATE_MBPS);
@@ -138,7 +145,7 @@ void test_tc_edt(void)
 	if (!ASSERT_OK(setup(skel), "global setup"))
 		return;
 
-	run_test();
+	run_test(skel);
 
 	cleanup();
 	test_tc_edt__destroy(skel);
diff --git a/tools/testing/selftests/bpf/progs/test_tc_edt.c b/tools/testing/selftests/bpf/progs/test_tc_edt.c
index 4f6f03122d61d..69f4b16acbef6 100644
--- a/tools/testing/selftests/bpf/progs/test_tc_edt.c
+++ b/tools/testing/selftests/bpf/progs/test_tc_edt.c
@@ -24,6 +24,7 @@ struct {
 } flow_map SEC(".maps");
 
 __uint64_t target_rate;
+__uint64_t tx_start_ns;
 
 static inline int throttle_flow(struct __sk_buff *skb)
 {
@@ -62,7 +63,8 @@ static inline int throttle_flow(struct __sk_buff *skb)
 	return TC_ACT_OK;
 }
 
-static inline int handle_tcp(struct __sk_buff *skb, struct tcphdr *tcp)
+static inline int handle_tcp(struct __sk_buff *skb, struct tcphdr *tcp,
+			     uint32_t hdr_len)
 {
 	void *data_end = (void *)(long)skb->data_end;
 
@@ -70,8 +72,12 @@ static inline int handle_tcp(struct __sk_buff *skb, struct tcphdr *tcp)
 	if ((void *)(tcp + 1) > data_end)
 		return TC_ACT_SHOT;
 
-	if (tcp->source == bpf_htons(9000))
+	if (tcp->source == bpf_htons(9000)) {
+		/* Note when the first packet with data goes out */
+		if (!tx_start_ns && skb->len > hdr_len + tcp->doff * 4)
+			tx_start_ns = bpf_ktime_get_ns();
 		return throttle_flow(skb);
+	}
 
 	return TC_ACT_OK;
 }
@@ -94,7 +100,8 @@ static inline int handle_ipv4(struct __sk_buff *skb)
 		return TC_ACT_SHOT;
 
 	if (iph->protocol == IPPROTO_TCP)
-		return handle_tcp(skb, (struct tcphdr *)(((void *)iph) + ihl));
+		return handle_tcp(skb, (struct tcphdr *)(((void *)iph) + ihl),
+				  sizeof(struct ethhdr) + ihl);
 
 	return TC_ACT_OK;
 }

---
base-commit: e1d84a37cba984388988d2f1ddc84561413f0db2
change-id: 20261009-selftests-bpf-tc-edt-serial-9c65af71f845

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>


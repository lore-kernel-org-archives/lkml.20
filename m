Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1514749CD
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 08:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788856282; cv=none; b=YcB+pkQHgZHYXEkU+cOf5JJgQML/73ZTpwZOYun2jH9/UC+wU/xzih+ayUPtcaEpHUi1FMSaw5mBSkbycA8ZEQ1zR9ti0mOgpQNAUcJa6Fap4rNt96x3m5WSANEpKZ5X2cNZvwF6rENj+Gj/WUlxKFDJs+p/8tqAhzmu4Gl/mGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788856282; c=relaxed/simple;
	bh=VOWmJwlWc7SYqz6NviqAALXf0GiO7jEmiavJ00IcvEA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ArAyaGysFYrKa0klk9g8Xe4EDjRFvKrPn7HyGHCaHdVV23LmMXj+COxxrRhw3X4l1oVG9eTWStF9evkNc/CoUt5l6PLbrbl5W8QYQkoE+zTNqSt6Hl3B6cD66HY1D9lX1L9DR7tDuCHHmQbwsnAkwiHm2olpQErUUhVO6z+73/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AfNqrdGk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NfZBovMN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AfNqrdGk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NfZBovMN"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886LniP2172672
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 08:31:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2qyfnFZk0oGAhMugpkxnEz1t5sj5W+rRALTd9m5wJm4=; b=AfNqrdGkz0PqCk+j
	kqzsG7hn/DvYX+a4Uhfnm9TAB2xGQftUNVupUuoZCWdEAWlW+YvEYKjEk1al4HQU
	QXLCF8vdI+uEWo3a6ya77ksCLb/Vl8EQgg7VACRyf1mpOBHcTxUUzchBHPNK9OlW
	u5bS6lzoznHYgdhg54XN5s58RZNu1xwO4i+kX67Y+FFXtrwrOTCgRrRes3KO1atw
	tN3vwPZ9+tqDITYequj4rynVrIzEb9rAJldP9lnJpbKaK9p9W2MF7RDyf2nuwxgC
	41uafjaMwi+iAgv24pwGE6SJB2JTWxPXAq6GiG3LY1PSqGVYk3HNydHTUT7Fw8v7
	nDWPvg==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj1rrjgre-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:31:19 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7f4e0b45e4bso4583726a34.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 01:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788856278; x=1789461078; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2qyfnFZk0oGAhMugpkxnEz1t5sj5W+rRALTd9m5wJm4=;
        b=NfZBovMNpUcInnAIsSjNO29mZfpL5/jFjncc+iECkJobQNO4mIrwpYgFXZGuRiR4QD
         qYsGRv3kVRgDeOv0rnwGCj2EZaSuF0F5Pfetwsh5u8VxYBBAQpzaeR7tc+g1pHhVgGgi
         0pkArFyr5Idh1Z+Gn+BhHUesdWP7Q/VfMj9p37iPMVukzZ5ctz3hztOrHP9uBE4RavC6
         JJiwwyAcAcqW8IwllUv/sB1Lpzu7FutjlCXBHFuCwGpRvA9afRG1KtqvPZPULcWZHefJ
         y/wY25MWsugnQoTMCIBzGuMYx+VaTHaypll7+C+EFBk90pEOSD4IyiA3UIaWikMkHyEG
         25/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788856278; x=1789461078;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2qyfnFZk0oGAhMugpkxnEz1t5sj5W+rRALTd9m5wJm4=;
        b=gTzwdtDKehbC4z+Sd5Umk8V/XQVZJPWLb76WCBfW5QxxcDZbCylRsXFtGfdjUyJS9V
         0t8rp2V0xBrU8T+m9ut/zhcOmP4JngzD7pWzaHZ6TVyMMve6X0qXBH6uLey11Bp7jU19
         ZUytBa6pOyaXpc8Ns9PXQ365bgfS9zKh4ScvZSmuPeRKPJwKyTqqPZ0aYBLijzxKNNTh
         Kasmqg4CYwHfB8hFcq5fSRkvIFIE+gj29vplMgvDB7clIkW97sFKl2Is0808AsDc8OXL
         EjCHDqGu4/ljn3iITKueJGPHOWXgSqywq7UPU1hyFkhE8101aNNO4hpZ3Hg9m9wXNP/G
         2SCw==
X-Gm-Message-State: AFuF++mTWHjHQTJJizGL4IT0T4ITlZLyp9rxDka9kvBJyhWLc5xZ4QJG
	rqmutbO08vEPxcQc43kB8uOpluanxKppfDGW8VVaolrfP23cGfY41bNvseIn7Fg8WIWObuMrfaG
	JJ5DzqDrY/iwZvTDJe3FxvGZmUVAie9EcYZ4a+r71LwK+Ucg5+xqQLjh9k9XwdX5KDts=
X-Gm-Gg: AYBFou0ApgQ6BBqjvnTkjvAbWwCGEK8TXICTckM+NNDQJgWnX1C2bL/2ikhD46sl7gf
	0NUlO9pWyiaTqv4e0kXC2TKh8frBY9kw6gU3IyyrftuUiEm5QXaMIWTfazRgLTQjqCDgOH0oukF
	NtbS6V8NmpXYsSoz6PK9hQzU6Rh5JnVVAWlv4Q4DrJrUBAvZeTjz22y/wnroID1UGgwrKFpHunl
	8MtK7mIrOaSqxTxWGgYZkBNzi/LbaWWPDSCBx7nelow14VdC4R3SY0M8AeM+g36642n9XlsXX7v
	zacljpMp3HJKZwB+yFGEA2TazgvQCzPxxXGjajAZjVfBnU+Padtw4qy4ZmqvRgoGwsZekpAbHAH
	9xdQoTcutRyBrQ8i6F/NLzjwWebbdQurk/BEzanNcswCBnzpiaosnweCmwTuz3TsxFtH8pofA+O
	JcCY03vVTIFlNQSOM=
X-Received: by 2002:a05:6830:3509:b0:7dc:c749:ade3 with SMTP id 46e09a7af769-7fa1deab695mr17694339a34.3.1788856278453;
        Tue, 08 Sep 2026 01:31:18 -0700 (PDT)
X-Received: by 2002:a05:6830:3509:b0:7dc:c749:ade3 with SMTP id 46e09a7af769-7fa1deab695mr17694327a34.3.1788856278032;
        Tue, 08 Sep 2026 01:31:18 -0700 (PDT)
Received: from hu-anancv-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bdf26c5sm34458641eec.27.2026.09.08.01.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 01:31:17 -0700 (PDT)
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 14:00:29 +0530
Subject: [PATCH v2 2/2] cpufreq: fix schedutil not returning to non-boost
 freq when boost is disabled
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-schedutil-boost-frequency-handling-v2-2-25312a713699@oss.qualcomm.com>
References: <20260908-schedutil-boost-frequency-handling-v2-0-25312a713699@oss.qualcomm.com>
In-Reply-To: <20260908-schedutil-boost-frequency-handling-v2-0-25312a713699@oss.qualcomm.com>
To: Vincent Guittot <vincent.guittot@linaro.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        linux-pm@vger.kernel.org, Ananthu C V <ananthu.cv@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788856266; l=3709;
 i=ananthu.cv@oss.qualcomm.com; s=20260903; h=from:subject:message-id;
 bh=VOWmJwlWc7SYqz6NviqAALXf0GiO7jEmiavJ00IcvEA=;
 b=QoFQI5h8STWQnYAFONEZGcYGQQhEdPSUuU+INfo1+hC7d3erZB+BtVGKXmjIdQ77emFJ59KNZ
 dKQfvNUOhxbBqufd6L3zsmP5d8xQmc2GdS5ufRnw7cHyrazL0/LwrGN
X-Developer-Key: i=ananthu.cv@oss.qualcomm.com; a=ed25519;
 pk=gutNfLSMVTRkB+MxVviMFq9I07C5qPe9xHY2J5XCMpo=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA4OCBTYWx0ZWRfX8eX0VgRLRcY9
 Dz8KXCMPdQEI9SclM6IINsfzbbjrAhbFQuYXkKevEs/7cAjjnH0o5kOoKUpcu5i8rX1Yx8R7oAI
 7h0u++E1N7HseCCCkUJhCAFCzvrr4bU=
X-Proofpoint-GUID: FLe3MTv8IUVJ9N8ML0e2WPhQTjmDC-pj
X-Authority-Analysis: v=2.4 cv=NsjhtcdJ c=1 sm=1 tr=0 ts=6a9fc7d7 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=fUeqwVvmJro1Iw4YaasA:9 a=QEXdDO2ut3YA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA4OCBTYWx0ZWRfX5lKL1lbH2X4a
 y/Hc/3Bwth5unPKeYTcR+wAexXQz5AhACo1+oS5k47Lya0EKDejyenAFWM4RJv1SzyDIFi+174n
 C7aUS+ox2NDbwRAO5CVX+DwwNgO4R+YV7Rqktj9M5D0nYqiNOGDbRovCLQxnH17q7E+zfTx91L9
 19Fjulvnv+abpFBbbl0Qyfgsp7BLtjVTWpqzBCpudQ83GCk805hAsNteGIB04t/RwqYnm1YRpbD
 +ozwhJmdkuUQuBaLINrWx9qZKfNnqj8x0yQvu6pm+ixU9hwaJEpu6XGC+qrpW0MbMNk70T+cxRt
 CkSYiaYK0hUQsE1B9QJuNYJs4mmO5x6c30ySlgLxJyfkw4AgWINR6rZUocO6O4ukWPTwkQ61F2D
 GXorqyvUjP1avibTYUu193jqH5Er3Ej/I4LfNHDlfiB0Psg7HlGkO7mmsDpdaGpZi1IkqrX0NAO
 Kq8srk6/It3kNJxsYzw==
X-Proofpoint-ORIG-GUID: FLe3MTv8IUVJ9N8ML0e2WPhQTjmDC-pj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080088

Commit 538b0188da46 ("cpufreq: ACPI: Set cpuinfo.max_freq directly if
max boost is known") introduced a guard for cpuinfo max updates to only
increase, to preserve driver-set values above the freq table maximum,
causing cpuinfo max to be stuck at boost frequency even when boost is
disabled.

Unconditionally track the highest non-boost frequency (max_base_freq)
in the freq table. When a freq table is available, use max_table_freq/
max_base_freq instead of cpuinfo->max_freq to control boost values, so
the value can decrease again when boost is disabled.

Fixes: 538b0188da46 ("cpufreq: ACPI: Set cpuinfo.max_freq directly if max boost is known")
Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
---
 drivers/cpufreq/cpufreq.c    | 14 +++++++++++++-
 drivers/cpufreq/freq_table.c |  5 +++++
 include/linux/cpufreq.h      |  1 +
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 0d0df986fa3d..a13e72711597 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -574,6 +574,7 @@ static ssize_t show_local_boost(struct cpufreq_policy *policy, char *buf)
 
 static int policy_set_boost(struct cpufreq_policy *policy, bool enable)
 {
+	unsigned int max_freq;
 	int ret;
 
 	if (policy->boost_enabled == enable)
@@ -587,7 +588,18 @@ static int policy_set_boost(struct cpufreq_policy *policy, bool enable)
 		return ret;
 	}
 
-	ret = freq_qos_update_request(&policy->boost_freq_req, policy->cpuinfo.max_freq);
+	if (policy->freq_table) {
+		max_freq = enable ? policy->cpuinfo.max_table_freq :
+				    policy->cpuinfo.max_base_freq;
+
+		if (!max_freq)
+			/* when the freq table contains only boost frequencies */
+			max_freq = policy->cpuinfo.max_table_freq;
+	} else {
+		max_freq = policy->cpuinfo.max_freq;
+	}
+
+	ret = freq_qos_update_request(&policy->boost_freq_req, max_freq);
 	if (ret < 0) {
 		policy->boost_enabled = !policy->boost_enabled;
 		cpufreq_driver->set_boost(policy, policy->boost_enabled);
diff --git a/drivers/cpufreq/freq_table.c b/drivers/cpufreq/freq_table.c
index 4984142dc08a..7e183e16162d 100644
--- a/drivers/cpufreq/freq_table.c
+++ b/drivers/cpufreq/freq_table.c
@@ -34,6 +34,7 @@ int cpufreq_frequency_table_cpuinfo(struct cpufreq_policy *policy)
 	unsigned int min_freq = ~0;
 	unsigned int max_freq = 0;
 	unsigned int max_table_freq = 0;
+	unsigned int max_base_freq = 0;
 	unsigned int freq, i;
 
 	cpufreq_for_each_valid_entry_idx(pos, table, i) {
@@ -42,6 +43,9 @@ int cpufreq_frequency_table_cpuinfo(struct cpufreq_policy *policy)
 		if (freq > max_table_freq)
 			max_table_freq = freq;
 
+		if (!(pos->flags & CPUFREQ_BOOST_FREQ) && freq > max_base_freq)
+			max_base_freq = freq;
+
 		if ((!cpufreq_boost_enabled() || !policy->boost_enabled)
 		    && (pos->flags & CPUFREQ_BOOST_FREQ))
 			continue;
@@ -62,6 +66,7 @@ int cpufreq_frequency_table_cpuinfo(struct cpufreq_policy *policy)
 		policy->cpuinfo.max_freq = max_freq;
 
 	policy->cpuinfo.max_table_freq = max_table_freq;
+	policy->cpuinfo.max_base_freq = max_base_freq;
 
 	if (min_freq == ~0)
 		return -EINVAL;
diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
index 3f3b1380251a..419c71ccff7c 100644
--- a/include/linux/cpufreq.h
+++ b/include/linux/cpufreq.h
@@ -46,6 +46,7 @@ struct cpufreq_cpuinfo {
 	unsigned int		max_freq;
 	unsigned int		min_freq;
 	unsigned int		max_table_freq; /* Highest valid frequency in the table */
+	unsigned int		max_base_freq; /* Highest non-boost frequency in the table */
 
 	/* in 10^(-9) s = nanoseconds */
 	unsigned int		transition_latency;

-- 
2.43.0


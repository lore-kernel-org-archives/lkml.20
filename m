Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794228477;
	b=4hfMij8VWLxZ1TeJ1AdbuKvSNWVqf6OtWUOfO2NWs28ZrHOJxXmxLJXzHxgAYasFn2Xw
	 TJkiTi8RFS8JKO+u8Gg0kmRhOkWI3vY0yoqagdKqwMLQDXN0048h1FwhVpolOdGRFQCT9
	 2OqG8WmWrLuf3aYPfPIUg+btJhxn+d7rxIbJh0JR48xffSA5QK/f8rsV0Qi/A/MkHnjDt
	 9KHSaLnAufMTrst1ExsqdLYavBGJRGs7W3m1KAA8tLzJFjOAYs3+FmUEH/Z0N8URftS5/
	 I8EEqHSwqUnT8wMNt1Je4Dch4LMi7krh9hWm998TcvgNoNQaavYrTVy47XSQk7aBxow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794228477;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=93Ud6tX5DUmvunUc03btclwxbqnXrbA4BzkJ7bh/H78=;
	b=HM6wRokkjzUh61PFKbNjefyD2EUhHp/5N2U2HAS7jPvk+ETCHYMp9QXB7fqRre3TqXC8
	 wmHJeByNoeYAqcz3OkrMQYHsczIQ0LUBtCizE2RRrXzyzr9cDWGs+O+QJDraTKPKMaQ9K
	 ydiWqKczFunMa6pduKaDDpOKQbUAo3XE4XdTXAkZVwRlLka9s6Eakyey3UHYsUOgQ0fFj
	 tXkE7Vt3BEf42Ou8nGZT34/7BlgbaNf5wZIjmxtbxZo5qHy01UZ/t2WLPboKJD1je3aL5
	 VSExd01Kcpy3Y95Fn+7hsgtMxsz9DLNl5YdPWLMs8DPlAh8asZCCM9Hza1RrL+AR3zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z7GQ5ekV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Hy6Ffk/x";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AA1606D80C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 12:47:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81AA1606D80C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z7GQ5ekV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hy6Ffk/x
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99v5mL561973
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 12:47:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	93Ud6tX5DUmvunUc03btclwxbqnXrbA4BzkJ7bh/H78=; b=Z7GQ5ekV7pUUF40/
	bX+P4gyHUJzsZeV5lNnPLBzus5l1FYGb8gpJ6zSN6EhWWCknbY9eEZhTEuZvZVhj
	a9iL2J1E0BpjinysqV7P7D9SDmk+V21ea9bsVc4VnbQSovxckpS6KAj5xKY6pRIV
	cUrY5B+x0g8kRRzs6YN+BVcYNIPHpY1tW0ezQUzm2jsT+XHT+pV792kVtd8/Q3gK
	mBPQVxeynpSn1EEOZHHwkavVyLWHMWM3ARzjH1fOOp0SMWiCHsZ9/Jgjva+QPS7i
	6UkRST3QP7zpZTLXeTrnkrTpiF/Dn/uzUTwKJ23zhJgzl/gh/7CF2jgicLQ2cdPa
	lioS3A==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsujxedk7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 12:47:55 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b35b88aa94so11224317b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 04:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794228475; x=1794833275; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=93Ud6tX5DUmvunUc03btclwxbqnXrbA4BzkJ7bh/H78=;
        b=Hy6Ffk/xX21gBVAiGa+rpqDmbsIHhkp33rXYBPW0Fgr4lgWYAKZny6e4v1pjcOH6Ll
         Rfv4LseIEJf8Jkr/q7YH48Gj5NR8Io4Xd8bDDkkMsZcSOjT+lyCFjqlNuKQEI4RgIMYJ
         OFW3hKFACSBmRWCksA+gos6Yq2viz0lUh2KmEHEl3kvGqcW2tRxcVV64W7pdM5U1eCHQ
         Fqo3A2q7rrWA9fRy9IR5ouC7RQX4F8uGsToQrzhIgXmHJd3/EnIYaWkdQ4YDilNbsdd0
         Y9w9Y/0IcglJ3sja9CP2u2tQbYJBsnTFV0/ELnmUxAakLKkzlznLCPeqtG89P++tfjug
         3LOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794228475; x=1794833275;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=93Ud6tX5DUmvunUc03btclwxbqnXrbA4BzkJ7bh/H78=;
        b=VULNEwSU+Nc17puYEtB68F4PtH9BSRfqCHX+MaNmMlfJNHncF04EKNLIkwLJb6utY+
         y7/NF176Qpqm5Iffdrl7bcuHntLvblP7O3f3YN0OUmYF0n6Ud/yKK7uydePv+ROeGgL1
         deMfNmMUno/6mh3zKCSXfxfvNGpCS3ZWxSunfHK6ndtfsLRfC5VegU3+rtniHUGbInMe
         LaD4oVOTJePRDHwcD0Mdv8yI1JeAJW0BBNt3zzHc6H6r6AIg1M/BzjArtvtteObvtEBo
         6XuoQ37+m9CQ3zRThyjsD+++0X9YRnyBeoYm55ys8xRuUZf4mGKOnTnhxBTWkThzpO7l
         l0kQ==
X-Forwarded-Encrypted: i=1; AL+hErE+oPpYj2nh3jYdGbu7E1GQQIBExI6K21cu1ID2xyQq/VN6V/i4AATNakZbdLKO+AstYd6fJ5kqJJGy9VY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9n9GguhYkr8KU86Xn+hsOT9W6bcNeD9lpTidSz0MYIhTjCBA+4
	qWdIeXzUVKdbBcXvNTLqQYmX6qAN3kSwmwDbev7xcyenZb5jWfvxbNqAxwZttvJ4uzC9t1RqjtK
	Ozm3r2SptN4WOMSFrZCXtWWGdPLQYLwgaANsitFoNlGLq9yw884S2SQTU3uFZxqxOuiI=
X-Gm-Gg: AYBFou0UYs0a1o4hIgS03xXwqnngVe3DyQQe4a7eMpge2HLjV1mC4Hvl2lZXBatifcl
	G5onPrk44V1FJapeBWTo1O20C8iuXS0h3USwmjgMdRedofOqVzgfEUTBU2DAW1vfAS71SdxEIxA
	+Lj/3HM8Y3quVbXckWTC4VtGviyjuNae3IxeQCB8Fi8UGCIKlMo4E066HL/VRURDC1wb6ri0rcc
	99mAKup/1jG9MbQ//W3k3ti8lBLR9FFwKIHst1jsjG7bwKewykN4Nlz33cjy+nYuPvzysRiPwjI
	YR9mMr06uCjepViwlFwrYe4TYQV4YsE/HyHM1/dIIN6JHIy5FkSKYH40966hVjtQ6VOc/iHejV+
	DT40mEn0tCcS76hUNGtidcM5j2hRtlk58zYG0nTVuSXJmUFs35wJaUR5KvASukqL1Wzd9pLXDsY
	LNhwYPtm8vhQ==
X-Received: by 2002:a05:690c:8e14:b0:8b3:b01:74d2 with SMTP id 00721157ae682-8b36ca33a92mr13349967b3.59.1794228474613;
        Mon, 09 Nov 2026 04:47:54 -0800 (PST)
X-Received: by 2002:a05:690c:8e14:b0:8b3:b01:74d2 with SMTP id 00721157ae682-8b36ca33a92mr13349727b3.59.1794228473849;
        Mon, 09 Nov 2026 04:47:53 -0800 (PST)
Received: from localhost ([120.244.9.94])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b36bbe3575sm34080897b3.23.2026.11.09.04.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:47:52 -0800 (PST)
From: Guodong Xu <guodong.xu@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 07:47:34 -0500
Subject: [PATCH v9 1/4] riscv: cpufeature: Introduce ISA bases bitmap and
 rva23u64 detection
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
Message-Id: <20261109-rva23u64-hwprobe-v2-v9-1-ae846c5c7178@oss.qualcomm.com>
References: <20261109-rva23u64-hwprobe-v2-v9-0-ae846c5c7178@oss.qualcomm.com>
In-Reply-To: <20261109-rva23u64-hwprobe-v2-v9-0-ae846c5c7178@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Randy Dunlap <rdunlap@infradead.org>,
        Radim Krcmar <rkrcmar@qti.qualcomm.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, linux-kselftest@vger.kernel.org,
        Andy Chiu <tchiu@tenstorrent.com>, Florian Weimer <fweimer@redhat.com>,
        Peter Bergner <bergner@oss.tenstorrent.com>,
        Zihong Yao <zihong.plct@isrc.iscas.ac.cn>,
        Mark Harris <mark.hsj@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Guodong Xu <guodong.xu@oss.qualcomm.com>,
        Andrew Jones <andrew.jones@linux.dev>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=8142;
 i=guodong.xu@oss.qualcomm.com; s=default; h=from:subject:message-id;
 bh=rFGx5xnsY6+CYs1od16ASQHM/wmyhX0GFjExDJkqLds=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhqyPB15bsnaUpLE1cdVHh9hbt027vYtDvt6Dfe4Zn+jGL
 by8HrwdpSwMYlwMsmKKLIePtmRvfeUT7fuc8wfMHFYmkCEMXJwCMJGIBwx/ZaLVBE52r1s207J5
 T/2FL2en266YJJUzObbk98Ztq4+d/sfw35MlzO3Pvu/X1h7/6DJl39lX7B0XWB/9rAlS1XZs1v1
 QyAIA
X-Developer-Key: i=guodong.xu@oss.qualcomm.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-Proofpoint-GUID: 2Lk18f7AQK4PN6kceqOf5FkEKUba1ceB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1MCBTYWx0ZWRfX/RaXDB4BdisO
 Ula2D0qoT1oypB/iqBluPnJSkST1wq5ygfZSfxIfrf6wjF1ANDasKNCsnuFUo1hFqc6XC+bir7W
 BFJqUz/nr1lJFosVi+uWLlVvBQo8libkVS7IG0P7xQlEjvN7F37mE7aUMBmtqZqL2odfhawess9
 cneenQKCeoNMjE5k8sV80Z3XPQkFbyuPZShRZoJkveUhntcWU/i2Is2Z7huyakXGdoW6TplpN6X
 Dr/5CHMRG7O5H5fKy60Lpoq6Hnxy46NnUrEgHd7Mgu2JQdGc5J8HtN18001lggn6JUuIEk5pKiK
 Dq5/CYOQKRcVFcaw+oEG8zpTdkCdVStzKaVYzEQslnTD3tku0YbB5C6Xp8nJM7sVFFsqY+GhpKX
 i2t0MZiCi9VcU0nIleXKyvsl9m0WyX7Vhm+xB1OD6aPx1oQYeZ5T9qR1uHS7nUFT0eRJDmS/Q+p
 wnz+JctQBqWBYssEbOQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1MCBTYWx0ZWRfX/2L4eW0punR/
 DVs88I2X8z6L+ULXehLarzws+rvOajYE2gdIw1riSKygP3SKcWkoKKZnns+4MFcWH9MWlTKX4QX
 7IWU2iZZ06CF6Y+NBSOZvtCJBfJQNew=
X-Authority-Analysis: v=2.4 cv=TeIDJhQh c=1 sm=1 tr=0 ts=6af1c0fb cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=ZvHX9x23NDWH3CQeJ2oX1w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=9qfSqdpAuJX0V-etOtAA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-ORIG-GUID: 2Lk18f7AQK4PN6kceqOf5FkEKUba1ceB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090050

Introduce a per-hart and host-wide bitmap of conformant ISA "bases"
(named profile-class sets such as IMA and RVA23U64), computed at init
time by riscv_init_isa_bases().

The IMA base is set unconditionally: it is behavior the kernel always
provides, and is intentionally not derived from the I, M and A
extensions.

Register riscv_init_isa_bases() as an arch_initcall. That is late
enough that core_initcall(tagged_addr_init) has probed senvcfg.PMM and
populated have_user_pmlen_*; without that ordering,
riscv_have_user_pmlen(7) would still return its default false and the
RVA23U64 detection path would always bail. It is also early enough that
arch_initcall_sync(init_hwprobe_vdso_data) finds the bases populated
when it snapshots the hwprobe values into the vDSO data page.

Consider this as the cache that subsequent consumers (hwprobe's
RVA23U64 base behavior bit, /proc/cpuinfo's "isa bases" lines, etc.)
can read without recomputing, which keeps them consistent with
each other.

Co-developed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
---
v9: Set the IMA base unconditionally; do not derive it from I, M and A.
v8: Add Co-developed-by for Andrew Jones (Conor).
v7:
- Register riscv_init_isa_bases() at arch_initcall, ahead of the vDSO
  hwprobe snapshot at arch_initcall_sync; v6 returned 0 for
  RISCV_HWPROBE_KEY_BASE_BEHAVIOR through the vDSO.
- Keep riscv_isa_bases static; add riscv_isa_base_available().
v6: No change.
v5: No change.
v4:
- In riscv_set_isa_base(), reorder those __setbit(RISCV_ISA_EXT_X,m)
  lines to make them conform to the order they appear in the RVA23 1.0
  Profile.
v3:
- Add a blank line before the subsys_initcall() registration (Andrew).
- Set the local ext_mask with __set_bit() and test the mandate set with
  !bitmap_subset() (Sashiko).
- Require the Zic64b ISA extension in the RVA23U64 mask,
  instead of open-coded cache block-size check. (New, thoughts from Andrew)
v2:
- Implement riscv_init_isa_bases() that runs at system init time,
  after tagged_addr_init() populates have_user_pmlen_*.
- Split RVA23S64 placeholder into a future patch.
---
 arch/riscv/include/asm/cpufeature.h |  13 +++++
 arch/riscv/kernel/cpufeature.c      | 109 ++++++++++++++++++++++++++++++++++++
 2 files changed, 122 insertions(+)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 99799cc6c198..2ce1a1e212c9 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -25,8 +25,20 @@ struct riscv_cpuinfo {
 	unsigned long mimpid;
 };
 
+enum {
+	RISCV_ISA_BASE_IMA,
+	RISCV_ISA_BASE_RVA23U64,
+	RISCV_NR_ISA_BASES,
+};
+
+/**
+ * struct riscv_isainfo - per-hart ISA state
+ * @isa: bitmap of ISA extensions this hart implements
+ * @isa_bases: bitmap of profile bases this hart conforms to
+ */
 struct riscv_isainfo {
 	DECLARE_BITMAP(isa, RISCV_ISA_EXT_MAX);
+	DECLARE_BITMAP(isa_bases, RISCV_NR_ISA_BASES);
 };
 
 DECLARE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
@@ -134,6 +146,7 @@ extern const size_t riscv_isa_ext_count;
 extern bool riscv_isa_fallback;
 
 unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap);
+bool riscv_isa_base_available(const unsigned long *isa_bases, unsigned int base);
 static __always_inline bool riscv_cpu_has_extension_likely(int cpu, const unsigned long ext)
 {
 	compiletime_assert(ext < RISCV_ISA_EXT_MAX, "ext must be < RISCV_ISA_EXT_MAX");
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 72bce616491f..0377fc148785 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -41,6 +41,9 @@ unsigned long elf_hwcap __read_mostly;
 /* Host ISA bitmap */
 DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
 
+/* Host ISA bases bitmap */
+static DECLARE_BITMAP(riscv_isa_bases, RISCV_NR_ISA_BASES) __read_mostly;
+
 /* Per-cpu ISA extensions. */
 struct riscv_isainfo hart_isa[NR_CPUS];
 
@@ -81,6 +84,26 @@ bool __riscv_isa_extension_available(const unsigned long *isa_bitmap, unsigned i
 }
 EXPORT_SYMBOL_GPL(__riscv_isa_extension_available);
 
+/**
+ * riscv_isa_base_available() - Check whether a given ISA base is
+ * available or not
+ *
+ * @isa_bases: ISA bases bitmap to use
+ * @base: bit position of the desired ISA base
+ * Return: true or false
+ *
+ * NOTE: If isa_bases is NULL then the host ISA bases bitmap will be used.
+ */
+bool riscv_isa_base_available(const unsigned long *isa_bases, unsigned int base)
+{
+	const unsigned long *bmap = isa_bases ? isa_bases : riscv_isa_bases;
+
+	if (base >= RISCV_NR_ISA_BASES)
+		return false;
+
+	return test_bit(base, bmap);
+}
+
 static int riscv_ext_f_depends(const struct riscv_isa_ext_data *data,
 			       const unsigned long *isa_bitmap)
 {
@@ -1406,3 +1429,89 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 	if (early)
 		local_flush_icache_all();
 }
+
+/*
+ * Compute the set of bases a hart conforms to. Profile bases such as
+ * RVA23U64 are derived from its resolved ISA bitmap.
+ *
+ * If @isa_bitmap is NULL, the host ISA bitmap (the AND across all harts) is
+ * used.
+ */
+static void riscv_set_isa_bases(unsigned long *bases, const unsigned long *isa_bitmap)
+{
+	const unsigned long *isa = isa_bitmap ? isa_bitmap : riscv_isa;
+	DECLARE_BITMAP(ext_mask, RISCV_ISA_EXT_MAX) = { 0 };
+
+	/* The IMA base is behavior the kernel always provides. */
+	set_bit(RISCV_ISA_BASE_IMA, bases);
+
+	/* RVA23U64 */
+
+	/* Supm with PMLEN=7 */
+	if (!riscv_have_user_pmlen(7))
+		return;
+
+	__set_bit(RISCV_ISA_EXT_I, ext_mask);
+	__set_bit(RISCV_ISA_EXT_M, ext_mask);
+	__set_bit(RISCV_ISA_EXT_A, ext_mask);
+	__set_bit(RISCV_ISA_EXT_F, ext_mask);
+	__set_bit(RISCV_ISA_EXT_D, ext_mask);
+	__set_bit(RISCV_ISA_EXT_C, ext_mask);
+	__set_bit(RISCV_ISA_EXT_B, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICSR, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICNTR, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIHPM, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICCIF, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICCRSE, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICCAMOA, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICCLSM, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZA64RS, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIHINTPAUSE, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIC64B, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICBOM, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICBOP, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICBOZ, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZFHMIN, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZKT, ext_mask);
+	__set_bit(RISCV_ISA_EXT_V, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZVFHMIN, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZVBB, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZVKT, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIHINTNTL, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICOND, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIMOP, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZCMOP, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZCB, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZFA, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZAWRS, ext_mask);
+	__set_bit(RISCV_ISA_EXT_SUPM, ext_mask);
+
+	if (!bitmap_subset(ext_mask, isa, RISCV_ISA_EXT_MAX))
+		return;
+
+	set_bit(RISCV_ISA_BASE_RVA23U64, bases);
+}
+
+/*
+ * Populate the host ISA bases bitmap (riscv_isa_bases) and each
+ * hart's per-cpu isa_bases.
+ */
+static int __init riscv_init_isa_bases(void)
+{
+	int cpu;
+
+	for_each_possible_cpu(cpu)
+		riscv_set_isa_bases(hart_isa[cpu].isa_bases, hart_isa[cpu].isa);
+
+	riscv_set_isa_bases(riscv_isa_bases, NULL);
+	return 0;
+}
+
+/*
+ * Registered as arch_initcall: late enough that
+ * core_initcall(tagged_addr_init) has populated have_user_pmlen_*,
+ * and early enough that arch_initcall_sync(init_hwprobe_vdso_data)
+ * finds the ISA bases populated when it snapshots the hwprobe
+ * values into the vDSO data page.
+ */
+arch_initcall(riscv_init_isa_bases);

-- 
2.43.0


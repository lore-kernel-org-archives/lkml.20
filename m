Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794369467;
	b=GEjfU6elhaP2odTMyIZaYO1zXBeg5doCak9c1mTXSRqHUIb2VKKfNOG7Mt1xN0/sNayj
	 tkJ+jc1e4RThR5KiDgDfolY1QjudTL62LxkWtZsOWRqI0CZqWA1N8un7LfaXw/YHbEww1
	 D3Ae7ljlpaLKidMEcsG5DoWygC9TUOdWztP7hiyuHbIPOXGuaqMwuWYENeRduBDfPRB8L
	 4o89LIrgAcnq25hBpWe+In1K8sWGkJaYxyImwbKd4YiFdqAjedLqgzVlRvXni7nqDz+0+
	 LPZJPM03efyLJ0tumgP570DiwzZvoMU+3cmguQW+ryVpKNQFdtxs00LhfXOamkdIaKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794369467;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:X-Mailer:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=IKem5FgakdEdIB35uZKqr8p4QZdIHzHf8aQ2aoNr2TM=;
	b=EDsc+C2KGzdK7prUzbAGuM9SnuRy7p3XQ6t7LJ+Mpi4/rnFICs9kVbQePgkl+yISXNfr
	 mNFw7d9p9hLWxkMsQvdcPW7ELjLENqd7T7VtYfa9Zsk3cgsWYErZdLqsXvTXmZDm7pJEy
	 NgJGOE3b0Pr1kZHw0QBv180TtgeiORvmStjChe8ndchRNrf0e4Bd6/1j8Wn3DvdQfUZoS
	 lJ5C5SsSFEF7X15yRehxoAcbUatB7NG1ed67dRygTxyEhP87gsMmBvSTQaZ1ZdLWCzHba
	 V9CC9+ygM3KSg9wIoRJ2g4dmDZmK3d5cELVwk6y7/mq2srvKBYipa8xZmiclAVqonBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=hpTCFZFm;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9709606A320;
	Wed, 11 Nov 2026 03:57:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9709606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=hpTCFZFm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=IKem5FgakdEdIB35uZKqr8p4QZdIHzHf8a
	Q2aoNr2TM=; b=hpTCFZFmsVcI48DJHG3Ti4yS3l+4PAcOIpM0hTN0P7ENRjVv8E
	bAGtAGaWlT2xNOnGFFJdNAa1dX4GrhkSB9sFC7A10vLRnjuru5a9YHS68bDTqq8P
	mXKHeMFzF1NKaC+k0ahANnkK8wY4tS9QD3S8l0o1RDELaax5rYYkOUBtc=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.178.45])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgD3bjOr5_NqEWipAA--.175S2;
	Wed, 11 Nov 2026 11:57:32 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] arm64: dts: qcom: sm8750: mark the ADSP fastrpc node as non-secure domain
Date: Wed, 11 Nov 2026 11:57:31 +0800
Message-ID: <20261111035731.940893-1-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107032646.32363-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261107032646.32363-1-xiaqinghuan@mail.ustc.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Mailer: git-send-email
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:3pYKCgD3bjOr5_NqEWipAA--.175S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cry3Ww15Jry5Ww4DGFWktFb_yoW5Jry5pF
	4rCwsrWF4kKF1Fq3yjgFy0ga1Fvan8JFWUGr1DJ34ay3Z09r9xAr1ftwsagayUJr4rCw4a
	vw4aqrW8ZF1UXa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkab7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l
	42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
	WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAK
	I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
	4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
	6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jeT5dUUUUU=
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREIB2rzcNkj9AAGs+

On SM8750 the ADSP fastrpc instance used by the sensor core (and by the
other non-secure ADSP users) is the one the firmware exposes as
non-secure; the CDSP fastrpc node already carries
"qcom,non-secure-domain", the ADSP one does not.  With the fastrpc driver
keying the secure/non-secure split off that property, the ADSP only
instantiates /dev/fastrpc-adsp-secure and userspace never gets
/dev/fastrpc-adsp, so libssc/hexagonrpcd cannot attach to the sensor PD
(qrtr service 400) and iio-sensor-proxy reports no sensors at all.

Observed on the Lenovo Legion Tab Y700 Gen4 (TB322FC), which is SM8750
based: without this property /dev/fastrpc-adsp never appears and
iio-sensor-proxy exposes neither accelerometer, ambient light nor
proximity; with it, qrtr shows the "Snapdragon Sensor Core service"
(id 400) and all three sensor types report as available.  The change is
one property on one node, matching what the CDSP node already does.

Tested with `make CHECK_DTBS=y qcom/sm8750-mtp.dtb` (no new warnings; the
single avoid_unnecessary_addr_size warning on dsi@ae96000 is present
before and after).

*** AI-assistance disclosure ***
This patch and its commit message were prepared with the help of an LLM
coding assistant.  The author reviewed the change line by line, ran the
checks quoted above on his own hardware and takes full responsibility
for the content.

Fixes: be9d54c35312 ("arm64: dts: qcom: sm8750: add ADSP fastrpc-compute-cb nodes")
Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
v3: move the changelog below the --- line, use a 12-character Fixes hash and
    place the new property after memory-region, as requested in review.
v2: add the Fixes tag requested in the sashiko review
    (<sashiko-outbox-202531@kernel.org>).  The diff is unchanged from v1.

 arch/arm64/boot/dts/qcom/sm8750.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index cf947acc57..9302481b11 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -2571,6 +2571,7 @@ fastrpc {
 					compatible = "qcom,fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "adsp";
 					memory-region = <&adsp_rpc_remote_heap_mem>;
+					qcom,non-secure-domain;
 					qcom,vmids = <QCOM_SCM_VMID_LPASS
 						      QCOM_SCM_VMID_ADSP_HEAP>;
-- 
2.53.0


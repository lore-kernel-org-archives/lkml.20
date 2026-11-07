Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794022018;
	b=HWePobAUtsHlzHySjNyy4Cusedl4RSTv6+g7XaAE000HJUYtinEKkbu4Y11CJZBEst0o
	 /7m8alXowmqDTaWPUwOGrichImprnEtXRZGdADzGBO+JMr7dkDbzc8q/zhH2seyKr5ho5
	 trVeTkGX5wfemnTnrwzDQq67/jyUKknHxozYFatbbHxDdBQRxKwlzCKDTAYptzHajL8R9
	 9vIEwQKR4zq5JVGwKTJkqC3c7VtPRDnlLEQYhUF5Ky4abHTM6pgPR+f6LLP5BfWt+0Bo0
	 teOi8qfoqb6Sot/Hkc+BEh3UKj6X28/4hk/yke2riLtISOTPaHgg3Z13nuieFSnwXtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794022018;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:X-Mailer:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=evRcGhEYiQnu+7s7f4X6oEhlfeS8eaZWbC+2vs7X5p8=;
	b=F653goiV2V8IQ8l48JQt9vAIYth6D2nqqIMldez5LQVIVfspjxIjf3hYNPk9Se4G6e/U
	 mIWS3GJFv8HzfTcFQPiHhHIGjEbqx3NHUA0ShohbouaLJ9M5SLz9Gi4tgF64/wz1e6Hhw
	 hJ30s1BWLyaWZaForLkwLpadHO4E43M+DNWIObZ6W9crbbi8CcyYcTlqTIUOhK9IFFmTv
	 Uvg/7MAnG2NYArs7mgWqWkcWqli3fGkkNNmX+QQVsFhRnZoy0edyUHT/M0v9t4rIS1/wK
	 DrlORRvhd3+00gskEOPG+ujL00wOw6DuArI0EoXaeKPejzNVNY2o26/8/jkjIbYdfqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=SJVVrF9P;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E094606A326;
	Sat,  7 Nov 2026 03:26:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E094606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=SJVVrF9P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Transfer-Encoding; bh=evRcGhEYiQ
	nu+7s7f4X6oEhlfeS8eaZWbC+2vs7X5p8=; b=SJVVrF9PSfV+wNcuB7G3asCcme
	jrLH0Lu0OnqdiRF8ymbCb8ATbQnBweR313vTKGu0tBY6gcbA0bGw58Swkl21OlPA
	fYFLAbWot05eNc6KYuFicJZjpV7HzLSe7H3IjUlkb5ltweMMvar7nd+46WLQVVI7
	13DezoxHaPtSqqY3U=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.185.236])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgBHrSF2mu5qAI6SAA--.1778S2;
	Sat, 07 Nov 2026 11:26:46 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sm8750: mark the ADSP fastrpc node as non-secure domain
Date: Sat,  7 Nov 2026 11:26:46 +0800
Message-ID: <20261107032646.32363-1-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
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
X-CM-TRANSID:3pYKCgBHrSF2mu5qAI6SAA--.1778S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cry3Ww15Jry5Ww4DGFWktFb_yoW8ury8pF
	4rCws7WF4kKF1rX3yjqFy0gw4Yvan8JFWUGrn8J34ay3Z09F9xJr1ftrs3KrWUJFZ5ua1S
	vw4aqrWxZF1UZa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkvb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
	C2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWU
	twCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r
	1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij
	64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr
	0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
	0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jeT5dUUUUU=
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREDB2ruKtgCVABfsr

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

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
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
+					qcom,non-secure-domain;
 					memory-region = <&adsp_rpc_remote_heap_mem>;
 					qcom,vmids = <QCOM_SCM_VMID_LPASS
 						      QCOM_SCM_VMID_ADSP_HEAP>;
-- 
2.53.0


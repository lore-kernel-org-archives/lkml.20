Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794277927;
	b=b56o47ZOzysLQcy5i499sfTAkpoq3i6dr7BP4CO+5qD2ZdglEKMGabCw+eSRGqjDq8fr
	 2xfoRJ6pG/fdV3aAiZ8hYzVNxRYB289cj7XIhKbmIb0r14vig0NCzNWdP3rr13XbUf6YS
	 hO3FAy5ti5gwTyQGjCBLvDmr2Set+Gr9A0XBbRk/0qZb9RmzqKd7VKt3kxRSvn/WFvi7E
	 Ld8O+4sG2iUW/5Mn99SFSiXQ0GsEVhghuLAG80QlAg1KgH7nlV5MIh9w2qYnoLQKHzb6g
	 4yu9iHzXFIMkmZWzspPP+CC6F59/GNohXc2mEjV03UWVmlOv/AowFuFy/ZkIeYY2cRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794277927;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:X-Mailer:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=mloBGBfIYO/HMZFaOg38+4ygcggZSdvoIUbpU+sqWuc=;
	b=0epxrFBc+xeRDlkYNdtbDEjGelXKJhgh0pJB+DWeC7PIexN+TEaIiWK4dA7KJpeP6N9s
	 Uf81sEWSdM2nGKS2WyFpbD+W0hSoL4vnQtYlMuiNGKWzZltvb3zOl2S/Rn8DI7WW4u8L9
	 ug7B+tU+lHMoNCMdS/pWDsF6kgaglBbqRKpvhCQs3vzvsSkLQO6Uddkvfov0nEVAll/eS
	 9NaWNMaNrpBKoia5F0GNXimbda2kK/WDVXfrchZ19D5DBUAvQcCXFSFA70d2JLiqbJOkJ
	 L8jSLGiHigjqPbKyBlYT8hxoPOrHUysZuQD2lAeQkBBLcRJ8ej0RABX51zgemBKS12w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=s+NYkTDQ;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2837C606A333;
	Tue, 10 Nov 2026 02:32:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2837C606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=s+NYkTDQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=mloBGBfIYO/HMZFaOg38+4ygcggZSdvoIU
	bpU+sqWuc=; b=s+NYkTDQYu5iSjy4CbJGo2f4I8vPdaX8QcT63m5miUU30NnhrO
	qs9sTJAq7rneYTXTRwAQR7z/8yfMuyQcZmUrthWthpsX1FkEH8CrlSRZZtnlMBWH
	h7erOk8Ro/UHoCnxF3MDPkg3spmPCC+xwxd3u94pGuKOolxwKFLyuvRCU=
Received: from xuqianhui.tail7a2807.ts.net (unknown [114.214.192.72])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgC3QEUZgvJqwQOiAA--.57S2;
	Tue, 10 Nov 2026 10:31:53 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: qcom: sm8750: mark the ADSP fastrpc node as non-secure domain
Date: Tue, 10 Nov 2026 10:31:53 +0800
Message-ID: <20261110023153.84262-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgC3QEUZgvJqwQOiAA--.57S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cry3Ww15Jry5Ww4DGFWktFb_yoW8KrykpF
	4rC39rWFs7KF1Fq3yjqFy0g3yFvan8JFWUGrn8J34ay3Z09r9xJr1ftr4fKw4Utrs5uw4S
	vw4aqrW8ZF1UZa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkqb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4
	vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWU
	twCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r
	1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij
	64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr
	0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
	0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8SdgJUUUUU==
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREHB2ryH1kW4wAQsr

v2: add the Fixes tag requested in the sashiko review
(<sashiko-outbox-202531@kernel.org>).  The diff is unchanged from v1.

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

Fixes: be9d54c35312479ed92c85aec3cd43153513210d ("arm64: dts: qcom: sm8750: add ADSP fastrpc-compute-cb nodes")
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


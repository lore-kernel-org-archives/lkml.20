Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793277080;
	b=5t2KAP7Cnm3fxboMtRRrZsxrkaElaPwyeZ8u/w/se8flnnnjBLESQA3XENXfA7IbUz1+
	 +cVMP+9lcZpWeZnTewxF8FHzfX291qsvW/gvuwkPw/Y5EZKe0GtSP7YxQ2Iazuvk90AcQ
	 pu7TajtoGu+9/9DHXCetakUjblrT/Mm9ryBdUX34tsp3ZVFj67XJ8gDKcHdIoQtH3AY3r
	 Ssrj1p1IeuuHPrFM5qfI6N5Sn6ppYViJh7PWiDX+uzdT5kkiX8AWQRLeJ6I/75CLbVxNv
	 BksKD4cv0uJJY1jcMg2ahD+TLp7+qaidoRBCrRRLF2TWYIAixLMT+5Vw4PXy4oJ/9QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793277080;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=x1c5YzEVioBo2uLqMIE3MXPESXSecJhUFVg+vvEICo0=;
	b=KuHz66dFeo0+3kIJ7DzELs6hlFZV3g9U5iO7RvcKsqsjMJlX5e+hz2HnbOQV1RaFmJb6
	 1/JovDZbg7VeAR+NQQ01diBmsPweaBj7bXpyUm2l5CXeejS94VZpkDCSWk4qhI7dKB7nS
	 yQ9hCeDcx9R+gnIhyvUI2o5AkNwTpkO7kkHjaHePTkZZIQIB/Ee1npts098r6Mt7JXz8F
	 /Eu40ef8wPyoqnQWzpdohVUpfBkhcVDKMWJttvgkdzjRd77G/VGyRIyucuWwR2eAfuO80
	 ixpZ9ftWc6Gb5b/FZfAnzKWtFR8wqQ6/NVBaUyKWVranKgpsDhtrDb0mWyZpgwDfC8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=r4t844eW;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 706EE606A31E;
	Thu, 29 Oct 2026 12:31:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 706EE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=r4t844eW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Transfer-Encoding; bh=x1c5YzEVio
	Bo2uLqMIE3MXPESXSecJhUFVg+vvEICo0=; b=r4t844eWHMfdfunAIR/8+LRyZW
	zO8l73XYKo7DgWIIACvvBQHHI6GKFhO3iTT6S8t+kqOgAgDRvm5ReOUFS1sh98rP
	6zJs7YxJM93X+OjosLnQAE2Z03FjSRSiDg4UBaJxMnkO7FNjqbdPx4JXl3TkS05T
	wNmc4offN4W2ucF0E=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.224.240])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgC3OD2LPONqnPVgAA--.841S2;
	Thu, 29 Oct 2026 20:31:08 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] media: camss: three fixes for the CSID power and VFE streaming paths
Date: Thu, 29 Oct 2026 20:31:04 +0800
Message-ID: <20261029123107.28705-1-xiaqinghuan@mail.ustc.edu.cn>
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
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:3pYKCgC3OD2LPONqnPVgAA--.841S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJF4fKr43KrW8Xr1xXFyxKrg_yoW5AFyrpF
	WfKas8GrZ8GFyxAw4xX3WUXFWrtwn3Zay7tF1j9asY93W5ZryjqrWUKas0qa4UCrW8Z3W2
	vrW2y3s7uFs0qFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvIb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r126r1D
	MxkIecxEwVAFwVW5JwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s
	026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_
	JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20x
	vEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE
	14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf
	9x07bYdbnUUUUU=
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREPB2riTVZTsQBLsi

These three patches are fixes found while bringing camss up on a new SoC,
but none of them depends on that new SoC support: each one is against code
that already exists in mainline and can be reviewed on its own.

As posted earlier, the SM8750 specific patches of the previous series are
withdrawn and that work stays with the existing upstream series:
<179325717815.489400.16602455641444097904@mail.ustc.edu.cn>.

1/3 csid: the power-on path repeats its cleanup sequence in every error
    branch and gets the first one wrong: when pm_runtime_resume_and_get()
    fails, the parent device reference taken by parent_dev_ops->get() is
    never dropped, so the VFE stays powered.  Fold the four open-coded
    blocks into a single label chain and route the pm_runtime failure
    through the parent put as well.

2/3 video: the write master of the newer VFE generations can only be
    programmed with a physically contiguous payload, because the frame
    increment registers describe one linear address range.  A buffer whose
    plane was not contiguous was silently written past the end of the
    first scatterlist entry.  Reject such buffers instead, and add a
    prepare_buffer() video operation so SoC code can add its own
    alignment requirements after the generic checks.

    For the contiguity requirement that Bryan asked to see cited: the
    downstream write master driver (camera-kernel
    drivers/cam_isp/isp_hw_mgr/isp_hw/vfe_hw/vfe_bus/cam_vfe_bus_ver3.c)
    programs each write master with a single frame increment of
    stride * height (line 3865) and aligns it to 256 bytes (line 3908),
    with no per-fragment addressing.  If this citation is not considered
    sufficient, patch 2/3 will be dropped.

3/3 video: when one subdevice fails to start, the ones already started
    further up the pipeline were left streaming and the next start tried
    to start them again.  Factor the teardown loop out of
    video_stop_streaming() and run it from the error path; also keep
    stopping the remaining subdevices when one of them fails to stop
    instead of returning early.

All three are build tested with W=1 on drivers/media/platform/qcom/camss/
and apply cleanly on v7.3-rc7.  They touch only camss-csid.c and
camss-video.c, which no patch of the Kaanapali series (v23) or of the
SM8450 series changes, so they apply independently of both.

This series intentionally contains no SoC enablement, no DT binding and no
CSIPHY change; those are being discussed in separate threads.

Qianhui Xu (3):
  media: camss: csid: unwind the power-on path through a single error
    label
  media: camss: video: check that a buffer is DMA contiguous and add a
    prepare hook
  media: camss: video: stop the subdevices already started when a start
    fails

 .../media/platform/qcom/camss/camss-csid.c    | 45 +++++------
 .../media/platform/qcom/camss/camss-video.c   | 78 +++++++++++--------
 .../media/platform/qcom/camss/camss-video.h   |  1 +
 3 files changed, 68 insertions(+), 56 deletions(-)

-- 
2.53.0


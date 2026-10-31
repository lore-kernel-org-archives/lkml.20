Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793419922;
	b=VvA5gO2Mpt8/vKZPWPkN2pqdQZwNRSJ4+QyMYCKY+Bix1i9t/najee63M4icFJLGZUGn
	 EuKpR/1BeTyX5Z8XqOltM+UFrfhaza280g7JT3h2hK/6bB3PAGJd5sVLSW5FxksvBgQpE
	 yPa2yWVlYNUvICnUDyex/9qDuecZzsMl71xnEVIJo/XOvk3u2LC/xi1BZXb9x41Uhifpv
	 RFm3DpgJvYekVKjXu4WW/WMFGBt7F4Sjg0+z7/aAqtKW7IIYbcV4zyeLltP2LzIlHWH4/
	 L3otkb57pLLP8bjAx38vt2oAZQHd/sp7w2lBQ5dyuKVwNh3NwRi+eIHgBlnG+wL7E8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793419922;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=lcZD6Y1siUsTtVPW8EeQ94LZJB8zSmepdQqFtxiPnw0=;
	b=v+FX4qpzmArf5UvnuAGKxgj1RPjez4sDYwGeC7XVRjV32Du0cIe3nPnQ3hdQYDnJ9Bis
	 c9CeLi+JkYhBQ19bvJsJKKC4pdgidKp1qI+WIgegPC1UnvLRLBKs2CyE7/iS6/nssLY01
	 94ZiEc5/cHgbl9DQ+KCapRWzRKC3T1WhYBGfVqM353B4KYcTIt5lgUEOzjHMG+77OlyC2
	 33AENiwoYazYXHgzJ5fZZtI6yBzX5xtuqTKGnOtpa+ql47FMVmCy+ipT4RfMP4gu2B3uE
	 DpZKSNILtDcvhwL2aEJ2btL8PD/u4OPpKI2ko4k6hIBZxQCVjJbG3xKsH4bhVll+xSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=RHHnqUUz;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 386D1606A31A;
	Sat, 31 Oct 2026 04:11:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 386D1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=RHHnqUUz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=lcZD6Y1siUsTtVPW8EeQ94LZJB8zSmepdQ
	qFtxiPnw0=; b=RHHnqUUzN2LcmLfhRh3RffncMVT/M5u7reO1Md4YIZL20Ezdnd
	V3FFsqMBb4pjC0Ti0Qr5nBIOSZQGdjQpQ8psTKNqzU9Ge1zti1H+yXZUOF4J7ytF
	MO28TtNivmEo2CF0yZMaEsxFGEfE8vetkT1ZBx4tXtOZ2qr81li7SQESg=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.177.113])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgAHjUGKauVqawFtAA--.1802S2;
	Sat, 31 Oct 2026 12:11:54 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-media@vger.kernel.org
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] media: camss: CSID power-on unwind and VFE stream handling
Date: Sat, 31 Oct 2026 12:11:52 +0800
Message-ID: <20261031041154.308030-1-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029123107.28705-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261029123107.28705-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgAHjUGKauVqawFtAA--.1802S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ZF18Aw45ZrW7WF1ruFW7urg_yoW8Zry3pF
	WSkw45Krs7KFySqw4xJw10q3W5W3Z5ArWxKF1Yka4Y9a15Cr12vr40kw1qkrWUGrZ2qw1a
	yr4jg3s7CF909aDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv2b7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l
	c2xSY4AK67AK6r45MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I
	0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWU
	AVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcV
	CY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAF
	wI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa
	7IU5iTmPUUUUU==
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREQB2rk8FYCLwAmsk

This is version 2 of the three camss fixes I sent on 29 October.  Two
things changed.

The DMA-contiguity check and its prepare_buffer hook are gone.  Bryan
measured that plane0 of a normal buffer has five physical breaks and no
IOVA breaks, and the pipeline still works; that matches how dma-iommu
merges the segments when the table is mapped.  The check tested
sg_dma_address() (IOVA) while the commit message claimed physical
contiguity, so the commit was wrong even before the measurement, and the
prepare_buffer hook had no implementer or caller anywhere in the tree.
I dropped the whole patch rather than rewording it.

The streaming fix is reshaped after Loic's review: the start and stop
walks now share camss_video_subdevs_set_stream(), the source pad is taken
from media_entity_remote_source_pad_unique() instead of pads[0], and the
subdevices are toggled with v4l2_subdev_enable_streams() and
v4l2_subdev_disable_streams().  The camss subdevices only implement
.s_stream(), so the helpers fall back to it; that is the only reason this
still works without changing the subdevice drivers.

The scope of this series is fixes only.  The SM8750 camss enablement is
not part of it; that work is with Hangxiang.  Both patches apply on
v7.3-rc7 and the camss module builds clean.

Changes since the 29 October posting:
 - drop the DMA-contiguity patch and its prepare hook (rejected on plane0
   evidence; it also never had a user)
 - factor the stream walk into one helper, use the remote source pad and
   the v4l2_subdev_*_streams() helpers
 - keep the csid power-on unwind unchanged


Qianhui Xu (2):
  media: camss: csid: unwind the power-on path through a single error
    label
  media: camss: video: factor pipeline stream on/off into a helper

 .../media/platform/qcom/camss/camss-csid.c    |  45 ++++----
 .../media/platform/qcom/camss/camss-video.c   | 109 +++++++++++-------
 2 files changed, 85 insertions(+), 69 deletions(-)

-- 
2.53.0


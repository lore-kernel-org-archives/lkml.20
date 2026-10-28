Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793179818;
	b=39h8novILovgFpCjMuS8hBS0hbTfJtyBYB5mGfo+ymV7E5dJ6xm/763K3dz2QXKTiaUC
	 swdfgXf/yzwZi24gZrI1F3fi8Wkam3WVUaTN0+8vqhzeNWd3TUg4/Kq1An2NDcxbpPeJ3
	 lGbzQ+EycblNnU2RlvfSMrh8TJE6cWGqDii7QrqkJs0TYHN79kj7ZDNVyiVgxiCfOG7+O
	 xmIHIvUR+Nr+sDg0sV2HyxKlqnDjtxgvZpVw3W0gKNKvccgu2gilryYTi36PU99OoD2uT
	 7i6ycQ3P7nViL0Pw4/HrMlCFS9/1pLMuwAf7aX8r7rrUxaALEDFgOmiYJYXVrta4wwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793179818;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=r8SpqM79fmDPf4QIoJcoFsSUCeCV4OIUB92EmZhcb9M=;
	b=nd+TocA1Y3AAT4PdoADPznwt8WjqnJL2QyB2d1XDwDJS1uauScaNpipDQ4OqvMQTI44S
	 FSTzDAskAqFmFAGNa9rVwmUbxNjLVAqq88MV2LX3YHl0hsRqxoyBxprlNOR8MmX7mSbT4
	 eOnJPZ5ISwLEmi8D0ZsHXPL7swjV7pwZ3o5dvQb+1tM5kubJs1BaIy/0586RWFKzqlMuv
	 tIB1a67m+B368EVp/2zBf8Oxbkd37BMYszBqoEJrxUR/OXtd+p2HzRbI6mYLPKPwlv0PX
	 XDqKhLgJZ7JCgbEKF5Kqj2zEHaDeDzK2a6xSnYvHo28tFqz4yG7/T3Zm53w3SZDDr3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=pWWIG90L;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC62C606A31E;
	Wed, 28 Oct 2026 09:30:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC62C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=pWWIG90L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Transfer-Encoding; bh=r8SpqM79fm
	DPf4QIoJcoFsSUCeCV4OIUB92EmZhcb9M=; b=pWWIG90LAZDE+Q9Va23OzdSS08
	JBqCFGJA4XVLmfN/xqnbM0qBX+TbdLWfc9V3pSvUbljuL8BGSaqgrHv2ZshNjcFL
	NLLa5qZigSxeMz2faHvy1GqNw3kowGsreAEVvCoW8REnfVXSVjPdBv5VVgVvUVKr
	LubNafs8uHeoe7bKY=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.180.23])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgB36i6cwOFqbQZYAA--.619S2;
	Wed, 28 Oct 2026 17:30:04 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: 'Bryan O'Donoghue' <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/9] media: camss: add SM8750 support
Date: Wed, 28 Oct 2026 17:29:54 +0800
Message-ID: <20261028093003.722745-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgB36i6cwOFqbQZYAA--.619S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Aw1UAF43tF4DGF43uF4kJFb_yoW7Zr1rpr
	WrK398KrWkGr4Ivr1xJw18JFWfAwn3Jay5KrZFv34jv3y5Kr1Igr4fKF1jqrW7CrZ5ta42
	yF4jqrWxuF4YvFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9mb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkI
	wI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r4fMxAIw28IcxkI7VAKI48JMxC20s
	026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_
	JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14
	v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xva
	j40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr
	0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07boxRgUUUUU=
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREOB2rg+9YyDwBRsS

This series adds camera capture support for the Qualcomm SM8750 SoC
(camera subsystem block with three full and two lite CSIDs, six CSIPHY,
three full and two lite VFEs and three CSITPGs).  It was developed on a
Lenovo TB322FC (Y700 Gen4 tablet) and both of its sensors (rear s5kjns,
front gc08a8) capture at full resolution and 30 fps with it, through
libcamera.

The block is close to the SM8650 one, but the capture interrupts move from
the VFE to the CSID: the VFE of this generation has no useful interrupt
sources, and the CSID reports RDI buffer done, register update completion
and CAMIF start-of-frame per CSI2 stream.  That drives the two structural
changes in the series:

 - camss-csid-980.c adds the CSID registers of this generation, with the
   full and the lite variant; the full one splits the register update into
   separate RUP and AUP commands that need an extra trigger write.

 - patches 4 and 5 keep the "add the generation" and "report frame starts
   from the CSID" parts apart.  The latter is the architectural change:
   frame start moves to the CSID, V4L2_EVENT_FRAME_SYNC is raised from
   there, the sequence number is only incremented on a frame start, and a
   buffer whose frame never started is reported with
   VB2_BUF_STATE_ERROR instead of silently being numbered.  An SOF can
   also arrive after an as-yet unhandled completion, so the EOF and SOF
   timestamps are compared and the completion is reported first in that
   case.  Generations that still report frame starts through the VFE are
   unaffected: the new vfe_hw_ops callback is only provided by the VFE
   implementations that need it.

Patches 6 and 7 are generic video-node fixes the newer write master needs:
a buffer payload has to be physically contiguous because the frame
increment registers describe one linear range, and a start that fails
halfway must stop the subdevices already started.

The CSIPHY 2.4.0 lane values in patch 2 are the ones the vendor CSIPHY
2.4.0 driver uses for the two-phase variant of this PHY: address, mask and
parameter type match for all 103 entries and the data byte for 99, the
four remaining ones being the SKEW_CAL data bytes, which are left at the
vendor value.  The three-phase variant of the same PHY uses a different
address layout, so its table cannot be reused here.

Not included on purpose, to keep this series reviewable: the CCI/I2C
control path of this platform, the CSID to VFE instance pairing and the
repeated RUP on the initial buffers.  Those are being prepared separately.

Patch 9 describes the block in the SoC dtsi, so that dtbs_check exercises
the binding together with the node; the node is left disabled and boards
enable it on top.

Changes in v2 (addressing the automated Sashiko review of v1):
 - csid 980: DT_ID in CSID_RDI_CFG0 must be derived from the RDI port, not
   from the (always zero here) virtual channel; deriving it from the VC
   gave every RDI the same internal CID and broke streaming on RDI>0.
   This mirrors the fix already made for CSID gen3.
 - csid 980: unmask INFO_RUP_DONE in CSID_CSI2_RDIN_IRQ_MASK, as the
   vendor driver does, so the software register-update shadow is cleared
   when the hardware consumes an update.
 - vfe: clear output->frame_started once a completed buffer consumed it,
   and avoid the unsigned underflow of output->sequence - 1 when the very
   first buffer completes before any start-of-frame; the "buffer before
   SOF" error is now detected on every frame, not only the first.
 - vfe: return -ENOIOCTLCMD from subscribe_event and drop the explicit
   unsubscribe_event op, so generations without frame_start report a
   consistent -ENOIOCTLCMD for the event ioctls instead of a mix of
   -EINVAL and success.
 - dt-bindings: fix the sub-block counts in the commit message (three full
   and two lite CSIDs, three full and two lite VFEs) to match the schema.


Qianhui Xu (9):
  dt-bindings: media: add the Qualcomm SM8750 camera subsystem
  media: camss: csiphy: add CSIPHY 2.4.0 lane settings for SM8750
  media: camss: csid: unwind the power-on path through a single error
    label
  media: camss: csid: add the 980 generation
  media: camss: csid: report frame starts from CSID
  media: camss: video: check that a buffer is DMA contiguous and add a
    prepare hook
  media: camss: video: stop the subdevices already started when a start
    fails
  media: camss: vfe: add the gen4 block and SM8750 camera subsystem
  arm64: dts: qcom: sm8750: add the camera subsystem

 .../bindings/media/qcom,sm8750-camss.yaml     | 435 ++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8750.dtsi          | 179 +++++++
 drivers/media/platform/qcom/camss/Makefile    |   2 +
 .../platform/qcom/camss/camss-csid-980.c      | 470 ++++++++++++++++++
 .../media/platform/qcom/camss/camss-csid.c    |  45 +-
 .../media/platform/qcom/camss/camss-csid.h    |   3 +
 .../qcom/camss/camss-csiphy-3ph-1-0.c         | 124 +++++
 .../platform/qcom/camss/camss-vfe-gen4.c      | 212 ++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c |  74 ++-
 drivers/media/platform/qcom/camss/camss-vfe.h |   5 +
 .../media/platform/qcom/camss/camss-video.c   |  78 +--
 .../media/platform/qcom/camss/camss-video.h   |   1 +
 drivers/media/platform/qcom/camss/camss.c     | 369 ++++++++++++++
 drivers/media/platform/qcom/camss/camss.h     |   2 +
 14 files changed, 1938 insertions(+), 61 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8750-camss.yaml
 create mode 100644 drivers/media/platform/qcom/camss/camss-csid-980.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-vfe-gen4.c


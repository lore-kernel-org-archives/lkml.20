Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6750C52F276;
	Mon,  5 Oct 2026 17:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220752; cv=none; b=qZp7KazZBE6Q16dDazX9hMFjqGAmi8c/4xDNWJ2+etDius9h6/6xyW+RIYfkW4wsle2rLlRsSN1zES6HtAi6ehVqYua6eWMECXIIVU6r4Nife3maiVlvWC33g10C8mupTlJUos6Ju0Ok3lFNcitu5GbZ/nBt9zWAQVtehjDI4pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220752; c=relaxed/simple;
	bh=5e+q4TCXQGoXItJZIg01pjZhKGXCsA1kAZgp8jkqTME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZXrbRIlx78HLReE9Wainz8CvZVYE5NAY5h1x33tChYScE/CFfBQ3y/pD0+3D4bA8vgQdawi15G0EN0sVe8tLcDdc8GsQ10HY2bkMWiYGHuJ8FC9DR7hVdaZR+6g0mmi6DsfcpTwnsGJme8gNpc4ogO3dcnfXkdUz5OnW2et0VF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ax/1dOU4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ax/1dOU4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4796E1F000FF;
	Mon,  5 Oct 2026 17:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220751;
	bh=eM2eSoBfK7UQlxslfOLMAUF8tLhozKrVeJnSTAKakz4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Ax/1dOU4GKGU82UeWrh1Hmf224urdOHAUckJ7Zln7gDDiJDBjoXbAp0wyvijE8YtD
	 1XJql7qOh8C6ToXRAnR6bj51cb+GqgzLPAKaiAabvjMLUYfGloEo+TpQ7dauXEfedy
	 jAlaHDY/07P4M9sJUCvrqGnlCkuUhEqEaCpgTKa3ly/IWHuutG2/+HubsmGengxgna
	 /s5iRVbRm/C9j6npzhNrVBWycjSu+P7A8Vnn4NSNmylv62sX0uom2M8si8PxdNI4im
	 aR6MiK1H4Jk4nWKsI3L5QyNJQOKYL5Q/N0KxBM3FarqFoS6UqeAbWggexuPiFU1asx
	 BJMHmm4P7RWMQ==
From: bod@kernel.org
Date: Mon, 05 Oct 2026 19:14:29 +0200
Subject: [PATCH 59/74] media: Documentation: uapi: Add qcom-camss ISP
 statistics
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-59-ed985aefd611@kernel.org>
References: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
In-Reply-To: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, Keke Li <keke.li@amlogic.com>, 
 Richard Acayan <mailingradian@gmail.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Gjorgji Rosikopulos <quic_grosikop@quicinc.com>, 
 Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>, 
 Robert Foss <rfoss@kernel.org>, Milen Mitkov <quic_mmitkov@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2863; i=bod@kernel.org;
 h=from:subject:message-id; bh=g1c9IKan9MOjGAcLlQSt2+4Sn8dFibLAGkmvn6iMdNU=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9srKc1qM5VVsH6RzQk7aIUmBdQrVEO3U3/HD
 voHQzRh8qeJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbKwAKCRAicTuzoY3I
 OjWpEACintDPXqIEcnMv/mKxNDCzLiJkb0eJWsGHWSoqmIZ2JROU3Vbr0lo+han4CwCe92c2l/W
 2Vi50hczZHyfhOdVczR7qRrR2h/5GdFoyyvCZwGAJCDjc1TmdTprLrI/rNfL+kIkWNUrOGBK9xb
 hvFMPhfFrXluFIVh1Rm3HCZFMNH7gOY+yV8os1HkCbV7F8Gs5uWavVArLoH5A8ELNk8ebfmZJ2/
 gE4QQKMKfCDl4qjxBQe/Ttt97izzHmYT1LV7DOR6YdouLRO8iytZ8ishvHwrWRyifXBPVp7nGAn
 NkfRsFOLoZlt4sursQPHv0T0MRcGMUJDrkHdJQVxoxY7Szobp3XqZnI8M1YNPv9YIoi+tG5GxBD
 eMcZghD+Vw3jbtkOtVqGokef2UmrmHWJR7DGo5QyxAFxYsMgW9ml+GP2HndgaBTKlqyqwXlUUiQ
 nH5hbuVi9dPRZi/y2PEcrC+bzYaDT/6MO0kWKvdtAqICnsgAC1PjQ0ZBkWYBLrOwChhB9ijLlf5
 6YH7PNvxlDB8bZTy325nq/AeyR4KOM2gXMf7bLMkOlz5TzJDa+4HyAkw9d9D5sAXmgUY/Z97JpE
 Xxs7DafPzAxkq5WZFWtaPZo97nWGT0rNo1aqdGLWIBQ46qRs5HP4Weidp8BcJZ/uTW95qE7wWZr
 +WmB1Ktlj7xGXFA==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Document V4L2_META_FMT_QCOM_ISP_STATS: the v4l2-isp extensible statistics
container, the block types, and the AEC Bayer histogram produced by the
SM8650 IFE pixel path, with an example of walking the blocks.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../userspace-api/media/v4l/metafmt-qcom-isp.rst   | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/metafmt-qcom-isp.rst b/Documentation/userspace-api/media/v4l/metafmt-qcom-isp.rst
index 2f3654a9ba897..77372b3a32d7d 100644
--- a/Documentation/userspace-api/media/v4l/metafmt-qcom-isp.rst
+++ b/Documentation/userspace-api/media/v4l/metafmt-qcom-isp.rst
@@ -141,6 +141,56 @@ and a gamma correction block:
 	for (unsigned int i = 0; i < CAMSS_GAMMA_LUT_SIZE; i++)
 		gamma->glut[i] = gamma->blut[i] = gamma->rlut[i] = i;
 
+.. _v4l2-meta-fmt-qcom-isp-stats:
+
+*************************************
+V4L2_META_FMT_QCOM_ISP_STATS ('QCIS')
+*************************************
+
+Statistics
+==========
+
+The ``V4L2_META_FMT_QCOM_ISP_STATS`` format carries the statistics an ISP
+engine of the Qualcomm Camera Subsystem (CAMSS) gathers from a frame. It is
+captured from a metadata capture video node using the
+:c:type:`v4l2_meta_format` interface.
+
+Statistics use the :ref:`v4l2-isp` extensible format. The driver serialises one
+block per statistics engine into the data member of :c:type:`v4l2_isp_buffer`.
+Each block embeds :c:type:`v4l2_isp_block_header` as its first member, with the
+type member set to a value from :c:type:`camss_stats_block_type`. Blocks are
+placed consecutively, and their combined size is reported in the data_size
+member of :c:type:`v4l2_isp_buffer`.
+
+Which blocks a buffer holds depends on the engine producing it and on the
+statistics enabled for the stream. Their order is not defined: userspace walks
+the blocks by the size member of each header and skips types it does not know.
+
+The SM8650 IFE pixel path produces the AEC Bayer histogram,
+:c:type:`camss_stats_bhist`, on its ``msm_vfeN_stats`` metadata capture node.
+
+The following example reads the AEC Bayer histogram from a statistics buffer:
+
+.. code-block:: c
+
+	const struct v4l2_isp_buffer *stats =
+		(const struct v4l2_isp_buffer *)buffer;
+	size_t offset = 0;
+
+	while (offset < stats->data_size) {
+		const struct v4l2_isp_block_header *header =
+			(const struct v4l2_isp_block_header *)&stats->data[offset];
+
+		if (header->type == CAMSS_STATS_AEC_BHIST) {
+			const struct camss_stats_bhist *bhist =
+				(const struct camss_stats_bhist *)header;
+
+			use_histogram(bhist->bins, CAMSS_STATS_BHIST_BINS);
+		}
+
+		offset += header->size;
+	}
+
 Qualcomm CAMSS ISP uAPI data types
 ==================================
 

-- 
2.55.0


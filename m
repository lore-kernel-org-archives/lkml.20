Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258CC4D0A12;
	Mon, 28 Sep 2026 21:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790631621; cv=none; b=Fm5dms7HxqoKflpcHFZ4NPsqiej4LOEUTcGTOCOuLPZsyYCA8Ha2wQHxkjZfsmTBWpS21vLkUrLGs4vhk0drFyuiqU3YcpKS+PNkApJ/fBSMAZAUNv3dKrmsclJ/ePAOCQZpdb4FHDgsp+ReAlPgp7Y0cFzdPMLJdYjK8mJ+MYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790631621; c=relaxed/simple;
	bh=LZf21fD+j9f/HbhP+9gqW9gzUV4B9ajHFFI+1VL5AaE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FwhI5s675MUAY1gaG/4ACuugxqTXqO13oKRxg+A+tioAhie3kJwQFxfAAmrXvi8Vo+PuP2//uou37Tvu1fs2RG19wQyaDe/KKrSgW1NX2ehJnuNL0uv5IlpsNQTo0GQyxTdnaPfscQEw61vBHQf3pna2ZVsDsVyKHN+oziKIEZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WqpjNR5Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WqpjNR5Z"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DDE17C4AF13;
	Mon, 28 Sep 2026 21:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790631620;
	bh=LZf21fD+j9f/HbhP+9gqW9gzUV4B9ajHFFI+1VL5AaE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WqpjNR5Zl3U7PP3VTBR/updcUf+RaK9JyUGad07N4TW5RJ68CxcpFxZf+vx4fYbLw
	 Jod7I0Cq3hVEJWoVFaJTZ1vTiyI9a1217QoXxLukoJ9YLOWkeh0oIIeDk7qJkZnEYM
	 REhGjMSeT5XyXof/jSgvTqRNOiollVgHu25m5vC3kbQhVV7x8YIo8qH2ZDkCZ7nyy6
	 q62AtLMh0v4nlnq6E69kqbofqhM6Bvq7Nt759AcD1hBRSByItcr7h6D4Z+Appqb7tn
	 SzzkVDKtN6jJmzso1n+9jWROLZUQrtp4bgXkFKZJlPETZrE3w7nhjLbwBHGtral94J
	 GuUnhGLtEz4QQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF5F5CA5FAC;
	Mon, 28 Sep 2026 21:40:20 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 28 Sep 2026 23:40:15 +0200
Subject: [PATCH 2/2] media: venus: vdec: Start capture after a seek that
 streams CAPTURE first
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-venus-vdec-eos-v1-2-6e9eb3ce9849@ixit.cz>
References: <20260928-venus-vdec-eos-v1-0-6e9eb3ce9849@ixit.cz>
In-Reply-To: <20260928-venus-vdec-eos-v1-0-6e9eb3ce9849@ixit.cz>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2585; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=frYE/kM7Q7fbMjI7Ug1XRcOz9fBQyhrocMHXusn0u/g=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqut7D4QVywzZIE4/C1hFXXWuLwBE1O0jIBEexx
 7r08vaAuZqJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCarrewwAKCRBgAj/E00kg
 clPUEACZLj+T67hNpIoyn0r3jdBl2zQ32L1XQt8nsqammZqAb5GRm9k3rMB2DPiJyaoGsOdRqsd
 AHL2f2/+kS7wt/YvwfHm9gCROGCXSKk8xqk3wd/Z/DGBtX+/QWTSbcmXlb0onJcM+FHxTXJ14Ko
 nJJ+eJKEcM74DrWrKlBBY79tMLS3JQEa5OHcor1LOat+vVDM9tsPro3aVjyPxZe16aidtdMJXrw
 TyA7mvmoPLTBeD64AnkobEa1Gzfc9vaU5GEUGPP2cHHSxPH/BVMfJmzG8IcnNL50Xlclk38aWFo
 DCblsn6l1qKORXrEfLhgUI8gPQqYt3Rk3w64nIY4aEb7mJFwsEnSrYJX9y+Y+LEbDkboPPakfDp
 j4YpTsPdDlYj/CGNpOBJq9FZ7fEbyGeo1QvJ5/NbTMWzZL+dxBP4VTalkgg2nvauKNEs0iaCkF7
 7/vTtaI1cjQlIGQiWWpNRjcWDcw3oL5sfa9ehqeafEB9mBepKrYyTsKURTBcywLzQqNYcWhjX+H
 /Gm0kJmmCLgc6aBXw317d4ImoiEX9Jg3Zknfm+IjddOb6STBNjJuS5PRIGwCm727y8B3goSQr1l
 zkcU6KgmqkfouzpAOJI9l9zQ8HvPDAjJ1WreeNCA56QT0vSrXrBVg7gQQWZpCS0N1s5roi5TxYh
 jk7NmBba4mddUEw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

After both queues are streamed off, the decoder sits in
VENUS_DEC_STATE_SEEK. vdec_start_capture() does nothing while OUTPUT is
not streaming, and when OUTPUT is streamed on again, the SEEK path only
queues the DPB buffers if the capture side was already started. So an
application that streams on CAPTURE before OUTPUT gets a decoder that
never receives DPB or capture buffers: the firmware consumes the
bitstream and no frame is ever returned.

The stateful decoder interface does not require either order, and
GStreamer restarts with CAPTURE first. Finish the capture start from the
OUTPUT SEEK path when the CAPTURE queue is already streaming, the same
way vdec_start_capture() does in VENUS_DEC_STATE_DECODING.

Assisted-by: LLM
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/media/platform/qcom/venus/vdec.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 74591c7a820f5..ae6c2fc65404b 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1128,33 +1128,51 @@ static int vdec_start_capture(struct venus_inst *inst)
 free_dpb_bufs:
 	venus_helper_free_dpb_bufs(inst);
 err:
 	return ret;
 }
 
 static int vdec_start_output(struct venus_inst *inst)
 {
+	struct vb2_queue *dst_vq;
+	bool cap_waiting;
 	int ret;
 
 	if (inst->codec_state == VENUS_DEC_STATE_SEEK) {
 		ret = venus_helper_process_initial_out_bufs(inst);
 		if (ret)
 			return ret;
 
 		if (inst->next_buf_last) {
 			inst->codec_state = VENUS_DEC_STATE_DRC;
 		} else {
 			inst->codec_state = VENUS_DEC_STATE_DECODING;
 
-			if (inst->streamon_cap) {
+			/*
+			 * If CAPTURE was streamed on first, vdec_start_capture()
+			 * returned early because OUTPUT was not streaming, so
+			 * start the capture side from here.
+			 */
+			dst_vq = v4l2_m2m_get_dst_vq(inst->m2m_ctx);
+			cap_waiting = !inst->streamon_cap && vb2_is_streaming(dst_vq);
+
+			if (inst->streamon_cap || cap_waiting) {
 				ret = venus_helper_queue_dpb_bufs(inst);
 				if (ret)
 					return ret;
 			}
+
+			if (cap_waiting) {
+				ret = venus_helper_process_initial_cap_bufs(inst);
+				if (ret)
+					return ret;
+
+				inst->streamon_cap = 1;
+			}
 		}
 		goto done;
 	}
 
 	if (inst->codec_state == VENUS_DEC_STATE_INIT ||
 	    inst->codec_state == VENUS_DEC_STATE_CAPTURE_SETUP) {
 		ret = venus_helper_process_initial_out_bufs(inst);
 		goto done;

-- 
2.55.0



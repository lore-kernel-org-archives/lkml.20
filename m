Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2312E396B8C;
	Mon, 28 Sep 2026 21:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790631621; cv=none; b=WNdKHFAw7ZV2YYKIB01uTXKvKM+shQIktM9fw4KDDFfiUdPgxFjbyTu8QOxh9Xdz645Vmv/uZLIwH1w+9xRt7faUvJCiUL7FuiERDOnJheWCP+YFnkLR0F6KcWt9rnd8FtcDkyxKDA90DDkidqHes4yx8M6YY4EBprqX3ETE/xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790631621; c=relaxed/simple;
	bh=3ZDzdFxYbJYm7xzCv+PHC/iaTeit9v8RwfIAsE0clT4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fb2eCWID5Q35HV2PNwja2HdWqEdfSZaKFXxTyoBmPfJqbNlyKbK1xzCkgAcmHGdSkZW9inTjMUgUOdUahGoS/xi1imgF7xHzEbDpQv7b+x+2IXHQv5yZA3rlDrHuQQ7LXjB1pTRuTA0httKzcYwdRKxYbubYcRW+Wll/XjwxPjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tbW52eZT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tbW52eZT"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5C7FC2BCB3;
	Mon, 28 Sep 2026 21:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790631620;
	bh=3ZDzdFxYbJYm7xzCv+PHC/iaTeit9v8RwfIAsE0clT4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=tbW52eZTfxA9WPThLZoAvCMjJHr7hUNYat+WAyjRCwYeMHZnD+rDzWqouM3mGs0sv
	 lGmcS68eYU1ufptCPVR4cN6YG9nsnHk0VZwt8G8EmfNC3re4wtcZMLpTEpM6SxFYO3
	 M2CIIG+vch9F9DsI7kAJUtk5Q0rXaqbcfsi23cazbe/dpl+/w61DYszDI1NErxDK+U
	 /eG690T6I2XM9YhUoohoIzALNyB5MWog8Xq5grE+N3rl4NoI/6ulD8RTLhWFQVYJHi
	 hzW9OllLyvA+491bBxsuXxkubTGJpldd/1Wd+LTTTFb/YOqCec/Dy6b2BJydup1wSx
	 z2JlR/cyQSCxg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B03CCA5FAB;
	Mon, 28 Sep 2026 21:40:20 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH 0/2] media: venus: vdec: fix drain and restart on SDM845
Date: Mon, 28 Sep 2026 23:40:13 +0200
Message-Id: <20260928-venus-vdec-eos-v1-0-6e9eb3ce9849@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBG4avIrDuQBJXqVUoXMf5tx0UsmRoE8
 e7GuvwW722kSAKlvtooIYvKHAvsraLw8fENlrGYnHGt6dydM+KinEcExqzc+bqxvg6maS2V6Jv
 wkvU/fDwv6zJMCL/zQvt+AAvQkOVyAAAA
X-Change-ID: 20260928-venus-vdec-eos-9a451a4c0561
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, 
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1464; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=3ZDzdFxYbJYm7xzCv+PHC/iaTeit9v8RwfIAsE0clT4=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqut7D4EvnI7g1BCftzqiI5Jzk00BNd6j49Exb7
 P1488/HvAWJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCarrewwAKCRBgAj/E00kg
 ck8yD/48gW59S9RsF7T7X7Avvxe6iBcrg9a+24rm6hk3cqEXLnBpAKpnn1dK070foZ/GVZJrQki
 V6H7PQAKpRT293v4LwbJHpuBlm+XqAs7i5loe/omqzTM2vB2alQLoxUCOibggDzBSCQACQ//BGB
 t0RdT+T/gGWL3LMcPRqN9c6KnRWhg2a/gp1x9L43F4XsFSceofUAsIgvjS1/61w+0Lj6gqa3Nm4
 I+5s2aaQce4T+FLdK5yppFkqlmMzIzH9He/kmvKVsSUhMzzM1wVjhK8eUR1nCTMDI/hrklEJuwh
 nm39GBAQX9RzhGRZPfsuJvR2E4VG93szgi+pJH5aJymSZHDTG+9flXdfGBpO1AKxeT28xW8CVzI
 JRvhlbfx00XtEBgoXxQGRxdpFjOMTfAoFDrBDKu+pjnuld7kCufJ1cX7+OAjgZQOhkZDLqF2DO/
 ZrBL65hifpSOa3gO+Wuq4FU40WWQPJqPoRHOC16SHqJnCPCwwOxW9eCngNOnyiS/7o7VDPQiWFf
 vtgHVHwRLldzbeZ/TZbDd9wz5g+iOFxtLG73OFJ1uQq1aw0HB9hNDbbsr1TmBeCqk1WTVs5+Awu
 uLQju7vfvOMfUl84LD45/bYsoNOe+Y5BpM/bCwYFKEgntrtDfB862kbRmWoayt1CWnAdqhQF/br
 EzTiiDelUd6LhEg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

Please consider this more as a bug-report than the proper fix.

On SDM845 (Venus v4) every V4L2_DEC_CMD_STOP kills the decoder
session: the firmware rejects the dummy 0xdeadb000 address of
the EOS buffer with HFI_ERR_SESSION_FATAL, both queues go into error
and userspace sees poll() fail at the end of every stream.

Patch 1 hands the firmware a real, mapped buffer for EOS, after which
the drain completes as designed: every frame is returned and the last
capture buffer is flagged.

Patch 2 fixes restarting after a seek when CAPTURE is streamed on before
OUTPUT, which left the decoder without any capture or DPB buffers.

Tested on Pixel 3 (blueline) with H.264: output is bit-exact against
ffmpeg's software decoder including the final frames, and drain,
DEC_CMD_START, seek with either queue order, and mid-stream seek all
return every frame followed by a LAST buffer.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
David Heidelberg (2):
      media: venus: vdec: signal EOS with a real buffer
      media: venus: vdec: Start capture after a seek that streams CAPTURE first

 drivers/media/platform/qcom/venus/core.h |  4 +++
 drivers/media/platform/qcom/venus/vdec.c | 51 +++++++++++++++++++++++++++++---
 2 files changed, 51 insertions(+), 4 deletions(-)
---
base-commit: 7079a12d7506b07fb53b54a664bfad5fa9b16d70
change-id: 20260928-venus-vdec-eos-9a451a4c0561

Best regards,
--  
David Heidelberg <david@ixit.cz>



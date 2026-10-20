Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.29
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792525197;
	b=yZedi4+OtLf4cAj1UP6gVqnDpxPIhJhalmsENRN/QDWzaZ4uyQ+dz7cDgNIRqtqEVRU4
	 8Y7xryd82y4mipKgftVikuAeD2Q3SUepxuzts3+Lp8oZb5gunP8mVUR0PZh8RNdu6/U2g
	 Gy70FA50aiBntOJzmch4yzSslBclFeLO5FvQmT15NvRrqH0pGhXf4aPhTSuH+n+U6pcHv
	 vv+j22bgtM3LcjBySZkjlp5BuvBnkD5gGOylyW8bpq8KW0bRTAu8JIckInC/zKgrZOcHI
	 ppLq6OcV1dgSFh7InS+gLVit3a9ln8kmFz39au2ErTNnpaBasYymd+R2HVtTdKq3pLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792525197;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=39Jv+kqfa1W32Czq7DzcERVJw1tDLMb9xcUQlCNYUDA=;
	b=MoEcvPsGTKu17d1I3cMQcOSBuSkwkHLXza2DK5m9IQ8FFyvE/v8wQ/kdD86AguTb7Nbd
	 DpI+9XPI+hv/1339VDfKO7tjEgFiHwvP4ckU3McPgwECMcBYyi9MvY5lG6x95mqYelzHk
	 pGv6TQn/BqPm9jENTJQDaGMP8BitbMfAzlYlqkVa0xX51IFsoIENaaIuTEtK2RbPaPu15
	 nDsM+gEoDfpVvmoA1FETMbIeTzufq01GAH0o60Y3auyOmJ1Lmu7MjAwkpYp7IMizdnGr7
	 vt8sXB1jy3YSdx1Si8JZ5brHDPVBf28wz/ES1B9cGXYhaJCB7YzWtCt/1QA+Bx66Vpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=OF0OjImZ;
	arc=none smtp.remote-ip=79.135.106.29
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch [79.135.106.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A571606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:39:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A571606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=OF0OjImZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1792525193; x=1792784393;
	bh=39Jv+kqfa1W32Czq7DzcERVJw1tDLMb9xcUQlCNYUDA=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=OF0OjImZDwAsauYZbPVrHaaLs+pBj5Lbp5aWbOtvqEU4FcaWQKBxiBIzpkEpyJPaJ
	 59cphzhKV4nKT5rfEWzlGrO5aB6JcS94XoYcJRj5Wd1fVWkHwNTZxwXkohoa89ImFU
	 1pUPVrashP3er3tWCHfTIYzyBUEBxMxi7i8D/0g2+L6uFc2/qY7eAEPHlZrOgeWLnB
	 TzHU7KMCGQr3ikEZOQKM246X3t/wkDseBqA65i0fuG4SvIFUJmiv459R0YptWXsFxe
	 ACsHGLy4oAeTcTJhwfVt+wfPhtTEPmawOCUHVkrxg0FEDOUVYXU+csm/d0dmH22May
	 G1hyxevuqRU/w==
Date: Tue, 20 Oct 2026 19:39:49 +0000
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
From: Birk Skyum <birk.skyum@pm.me>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>, Saikiran <bjsaikiran@gmail.com>, Mark Brown <broonie@kernel.org>, linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] i2c: qcom-cci: Recover after a target powers down under a running controller
Message-ID: <20261020193946.51478-1-birk.skyum@pm.me>
Feedback-ID: 21326998:user:proton
X-Pm-Message-ID: 119cb6a596ebf28c973df8dc27618c54b90a8d4e
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On the Lenovo Yoga Slim 7x (X1E80100) the OV02C10 front camera on CCI1
master 1 fails to start whenever it is opened again within about a
second of being closed. The first register write times out ("master 1
queue 0 timeout") and the stream does not start. Two attempts so far
treated this as a sensor power-up problem. One gave the ov02c10 driver a
longer settle time, the other a minimum off time for the camera rails
through regulator-off-on-delay-us [1]. Neither is needed.

The sensor holds SCL and SDA low while it is powered down. If the CCI
controller stays clocked from then until its next transfer, the master
no longer starts transfers. The queue stays on its first command, no
interrupt arrives, and only the reset in cci_run_queue()'s timeout path
brings it back. A runtime suspend clears the state too, but only when
the power domain collapses, because cci_resume_runtime() does not reset
the controller. With the 1 s autosuspend delay, any power cycle of a
target that is shorter than a second runs into it.

Patch 1 resets the controller on every runtime resume. Patch 2 suspends
it 50 ms after its last transfer.

Tested on the Yoga with the driver from i2c/i2c-next, built as a module
for a 7.2.8-based kernel whose device tree has no off-on delay for the
camera rails. The CCI clock runs at 37.5 MHz there. Starting the camera
with v4l2-ctl after a pause:

  pause          0.05 s  0.1 s  0.2 s  0.5 s  1 s
  failed before   19/20  19/20  19/20  19/20  16/20
  failed after     0/20   0/20   0/20   0/20   0/20

With the series, 150 libcamera starts back to back all started, so the
sensor itself starts fine after a 50 ms pause. The same two changes on
7.2.8's driver, with the CCI clock at 19.2 MHz, gave the same result.

[1] https://lore.kernel.org/all/20261001-regulator-off-on-delay-v4-0-258ba9=
612da8@oss.qualcomm.com/

Birk Skyum (2):
  i2c: qcom-cci: Reset the controller when it resumes
  i2c: qcom-cci: Suspend the controller 50 ms after the last transfer

 drivers/i2c/busses/i2c-qcom-cci.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

base-commit: bd4a545e4f5dbd5e4dd0064777429813516b8784
--=20
2.53.0



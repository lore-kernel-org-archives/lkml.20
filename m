Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=138.232.1.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792956123;
	b=4OrFPRwns10YP+nEU+IK8lSt6xu1EJ5E6l5cUUxfgDjk1CYWXh3RQpJcqpLwQVxCLJxO
	 zBLfSsN0DiOEgpKTpxCuEzuuTurkUgTARAH+q6ARLaXdstAn10zY7i0fhK7nRb5QLg/Vk
	 73kxGJnxrZBfVdRL52BUwxIqFlLvF9mY7J3WrXTnQ57n7+0iqqldqIvtuCTU4Vf0WzvDD
	 r99LU4Cek+iSOez60FeJrICY0qeeoi78UpyO9x3Iw5OenYQyWDyIs7MwKXlcNO4Zsv8nD
	 JLKEVH0eUbiiuFF8AYY1/JoSozTQqqOmhEH0eaW8/PjWpxccH1vQaR1hMAG3Qiy/4cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792956123;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Spam-Score:X-Scanned-By;
	bh=Ayp/Q9Y1tgzFXIHVZ1yEQTHN8mO9FQgwx4GJ190p2IM=;
	b=fgVdMD4e38JjA/o12cA/cQG72Lj49DV7o8PQNsl+wnFeClphARKhqpVN4Nz/m1v5+wAK
	 pj2o8XvQpkB5LXXMI6F9aQqDAQjVmNCDk+0CMLCkEzK0Vn1WtnIfAw61SYh2e7nOg3Z44
	 Fgi5SVVIRG0feXqwxBUhEAYfU65fTqpm4RlbiJKTNxScsKp7LDFbbUPRHAHxHdeyqvLJO
	 HyR101LDpNAjkuBl9gVNiiDeE15ossreMfXD8JiaU+/S3/vUbVDBWBv5d9ioXeUHBpcip
	 xQO1G6g24WmOaP5UEZ1UeueVysHFyxZpJMR5SArtIa2e/Kkf2W1t9vPtMTMWH5BXwHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.uibk.ac.at;
	spf=pass smtp.mailfrom=student.uibk.ac.at;
	dkim=pass header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=qpoU0FLP;
	arc=none smtp.remote-ip=138.232.1.140
Received: from smtp.uibk.ac.at (smtp.uibk.ac.at [138.232.1.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C9E606A322;
	Sun, 25 Oct 2026 19:22:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0C9E606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=qpoU0FLP
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJLko3516701
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:21:49 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJLko3516701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956110;
	bh=Ayp/Q9Y1tgzFXIHVZ1yEQTHN8mO9FQgwx4GJ190p2IM=;
	h=From:To:Cc:Subject:Date;
	b=qpoU0FLPWW86wR12vYlkvJARkAb7TNCYFRYBTSIibxu9PqzmHz6ttAmUQBeVR4uCQ
	 QpUW7w34VDqyhxDtN/90AjbVu4lDE06DbH8LZ9JuJvgTRvz5Ahb92tCUHbKxHH6rRT
	 VpAPX8H7xw1Ad47/WGe3N96ckM1hR6NRmxrj7PSA=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
        martin.blumenstingl@googlemail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 0/2] firmware: meson: sm: make power-off work on S4
Date: Sun, 25 Oct 2026 20:21:42 +0100
Message-ID: <20261025192144.208954-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -13.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_H_APTO_LONG,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at

From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>

On S4 the firmware implements PSCI SYSTEM_OFF as DDR self-refresh, and
the power key then resumes into a kernel that is gone, so the board
hangs until it is unplugged. The vendor kernel sets a firmware shutdown
flag first and takes the secondary CPUs down through PSCI; do the same,
keyed on a new amlogic,meson-s4-sm compatible.

Tested: poweroff followed by the remote's power key cold-boots the box.

Tool use (Documentation/process/generated-content.rst):
This work was done with the help of an AI coding assistant, Claude
(Anthropic), used through Claude Code over many sessions. It did a large
part of the hands-on work: it read the vendor kernel and the firmware
interfaces, probed registers on the board, drafted the code and the
changelogs, and ran the builds, checkpatch, dt_binding_check and the
tests on the hardware. I directed the work, reviewed every change and
the final patches, and take responsibility for them. There is no single
prompt to quote; the sessions were of the form "find out why X fails on
this board, fix it, test it on the box".

Tested on an Amediatech X98Q TV box (Amlogic S905W2, S4 family, 2 GiB),
vendor U-Boot and BL31/OP-TEE, Linux 7.3 plus this work.

Christian Stefan Kövér-Draxl (2):
  dt-bindings: firmware: amlogic,meson-gxbb-sm: add amlogic,meson-s4-sm
  firmware: meson: sm: make power-off work on S4

 .../firmware/amlogic,meson-gxbb-sm.yaml       |  4 +-
 drivers/firmware/meson/meson_sm.c             | 46 +++++++++++++++++++
 include/linux/firmware/meson/meson_sm.h       |  1 +
 3 files changed, 50 insertions(+), 1 deletion(-)


base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
-- 
2.56.0


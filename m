Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794884716;
	b=SRl9zmzc/OtaL4Z/zszVVSQZn4tCXsaZBptsL191SpAiUbsR/YGkTT+PaDudYMzaRJNA
	 iqEP14QIeohE/fh86FVirvGXKGE3Qbj+njR0vF1zlKak2E3jRXl+codgJ1NhrLd3K7Mbc
	 HAGTMcFYcEOrpNTU1oUH1cnU4gz/7vjlQ5vauc+FgbXFVUGDlsAkNzHdDfFZwrOxQmDHn
	 uaFgrM+NpX2mpd5xHpjbB2RfxorcJlexAFKlx+AFTOXimjKxSVQkYS3Gf0tJ19yigRL/T
	 ILaJcNFkCfNzXONOwVZ1N0XKLJ5AH/BGrDdDxT/nt3IPFPj7ixQsg1UOmIpnDl0NiOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794884716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mCoALzMhu5q7+FAJc0HEyB8F4qmrYW3UsJsZLcqOZX4=;
	b=zT3g9FjZvGsNdczWG4vEg5oxE05NhfTtWOQXPK3UIRFYXslx1RIuhF7ugz+dIptSwZtL
	 wMJUPo29Q9iod3RHeXbksG876ZomOQH6AmbniS5VdoJM4MVTa0Q58loiovGjkmOituQW7
	 /U2fQZT67SAuT4Z2tHbcwkUoCuvcJTc+x+N5sJ8QnqEU24fTeBGx3WLfEy/jxSoeap58M
	 wiZ6k+VjgGi7z7UwNYnhv16mWygfjFAXOJJO6fbw63Cm4gMeFfbYX2DairiHeC9YG0FPI
	 mYDQmRG+bq5qBVQZfpoRJOBcp0QnLVrVXOu205n4Nl3P1Iw/seCngYyZ+dRiKjJXeaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="xjR7/BNc";
	arc=none smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F693606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:05:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F693606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xjR7/BNc
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5365d26ccbdso27730861cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 19:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794884714; x=1795489514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mCoALzMhu5q7+FAJc0HEyB8F4qmrYW3UsJsZLcqOZX4=;
        b=xjR7/BNcxJw6s62M/s+PdhaTGRoIONz4etd8ABsWI4I9NKfSdNlDj0TddCPf02hnZz
         lD3LxUVkgZ3r6ulmA/U4G4bxkKqafcPQ8yj4+UCUruC3FGh644jW9RrAWX5Hwr/lhzcT
         Qarvkt/O1ecdlybAFOS90B/d5oTWMeSh7opB+CcxUg+9mKmUPSYqdtHZEWtW22MkxIVS
         ehPOd7Ml0WXYSWllhmH10Q27i23Y8YlOnIolDHUVl5pZV1SbCBAaCPRIsS00m4As8QrC
         So8fEpJxSXKuSI5t5CJK088L7VOOjUXfcL9uRuHiWa9xIAo7lZq/fSUoUTUi+zFY+n5f
         FZNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794884714; x=1795489514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mCoALzMhu5q7+FAJc0HEyB8F4qmrYW3UsJsZLcqOZX4=;
        b=S65L3S0hVcnh1X9KmQswzqbZlsGuXzyQdb9dhc+s4iDfPhmuR0WTtxbKuELipkti1Z
         dyEGWMJUOHt8XxsinRAQa7dL1VHrw9cmNoBr3dK+QkNSRlL04MNTyNrrreFOdhpUjDKV
         feqnoAkR5sn9xx0jgfG/4t4eBE8PPfxvkwNRsRgOs1kqvrRjoscNyhZ820/Re8+YVeDx
         +aE8QQPzS53+P0mrE6ZE9nRNJjYb4P3mdjCequ//zlkQeM5vf6do0tJ6GarscHoSCfPD
         7OeGxkKJpmqX028swLiHAd4l9xvAzyiJog+7fdDuL6pS7us57LAriaGRHmdgcWfVtUik
         oCGg==
X-Forwarded-Encrypted: i=1; AL+hErHUhHXGN8LJoTN5Q9QFAjuXfa/e6erluUIvAwDSO07zHr17rrrgPux1LkE+ETfFRb4vdT+lYVvm7oRt7rE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sUnwafiFedxwI+jVMLy7qI/V9vL6HUwofEOsmxPHg9e3ZMC82
	3lS/6gDerOsWIeHiiNemFxN71C26QaNgKx4/G73txf5kx3ldgRfeLVOyNK72uJFM
X-Gm-Gg: AYBFou3tYZ0U0EQkyOx7Ij/F0Dj9nO4iUAUYlAhT7iXFz0diEuLs6JDMa8U8NInOGBt
	HDZvy2AB6CgBNotCWVXNuqBcfpRtuxawoJNI+Vtwi4gxKXmPprKkxs4KPWS1cFFql11D/tvVev9
	5h4obbd3BHgxmgE//IqpzXFCAwCyqW9wdihGDuCfV358pJ+5cjdiTwIssySHPlEPsSheH+7jDZA
	PJKKRJYOvqiQDcsMdYsiNjDfKvH8QPv5CHejCK+l/gE3sX6Y6w06cj5p9D62LpL8M8N2qKD2I/O
	ssjY/bbu2W6bCqSvi1ZCt9++c7TI8GdMoUJNPND21mclsjJt3oP4f+6vimmt/jnhQBVmMZnC6t2
	PsrcmjuJyw+a/y5G+u4AdMVwOikF8usVJcfR4oM6gEJxMswlsxkL218KpUS4SsgFARM3gbpIsaa
	NVJTk18dvjeJ6Hw6BVw17eSbvRUlopQic23JGMQuu2TRtJ6fOhhiSMe2YEjNf8Y9JQzDpf325ZZ
	l1Zrs4nW3B0ErTMTU+ID8UQMrpjzAnxZ75Sd+8vWjeQstagmBahvIBccGCJqwjOgiHWzRxak7k5
	TuU//t/aOyI/RKGO6Sql7ao1E3uUusYmr7mHmHSnzhtuC6W/OC7ZvnX+6+/7vONCg8bX5YNqoEo
	=
X-Received: by 2002:a05:622a:c8c:b0:55d:3695:c1b8 with SMTP id d75a77b69052e-55d3695c801mr97933321cf.11.1794884714307;
        Mon, 16 Nov 2026 19:05:14 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d453casm100066256d6.10.2026.11.16.19.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 19:05:13 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH] rpmsg: glink: hold idr_lock while completing open_ack
Date: Mon, 16 Nov 2026 22:05:09 -0500
Message-ID: <20261117030509.1708983-1-lcy8047@gmail.com>
X-Mailer: git-send-email 2.43.0
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

qcom_glink_rx_open_ack() looks up the channel in lcids under idr_lock,
drops the lock and then completes channel->open_ack.
qcom_glink_create_local() waits for that completion for five seconds.
If the wait times out at the same moment, it removes the lcid under
idr_lock and drops the last two references, which frees the channel.
The OPEN_ACK handler then reads channel->name for the trace event and
calls complete_all() on freed memory.

Keep idr_lock held until complete_all() returns. The timeout path
removes the lcid under the same lock before dropping its references,
so the channel cannot be freed while the lock is held. Taking a
channel reference instead would not work here, because the handler
runs in interrupt context and the final put may call
cancel_work_sync() from qcom_glink_channel_release().

Fixes: b4f8e52b89f6 ("rpmsg: Introduce Qualcomm RPM glink driver")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---
Found with a static analysis tool we are developing.

Compile-tested only, with x86_64_defconfig plus MAILBOX, RPMSG_QCOM_GLINK_RPM
and W=1.

 drivers/rpmsg/qcom_glink_native.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index f848ab46161d..862565bf965d 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1101,16 +1101,17 @@ static int qcom_glink_rx_open_ack(struct qcom_glink *glink, unsigned int lcid)
 
 	spin_lock(&glink->idr_lock);
 	channel = idr_find(&glink->lcids, lcid);
-	spin_unlock(&glink->idr_lock);
 
 	trace_qcom_glink_cmd_open_ack_rx(glink->label, channel ? channel->name : NULL,
 					 lcid, channel ? channel->rcid : 0);
 	if (!channel) {
+		spin_unlock(&glink->idr_lock);
 		dev_err(glink->dev, "Invalid open ack packet\n");
 		return -EINVAL;
 	}
 
 	complete_all(&channel->open_ack);
+	spin_unlock(&glink->idr_lock);
 
 	return 0;
 }

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.43.0


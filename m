Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6866B37C925
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 18:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788978812; cv=none; b=rnH9L6mscU6l0CJkLJaovEjoJIPGiiW8wqmPbGqxJJJLI5e8xeKv0LJF75xLVh/fSQ7PJfXm3vyVbE/htOYFhhQA9dhSIaHowL34Rj/qI+RuemKfMejNpEln/u1g4X0UpBnAnbie4Ak4jiY//ZQhm+IZUQJ5u/C2AbZyHp1ruHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788978812; c=relaxed/simple;
	bh=peV0QDmOv2RpylKNsqiOQ0PlLLqXwh9h6AojzDr/wKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AnHNZBqRXAJEVhNMQcU6YUDlNKmIWXs6KOP4lPed/Plmv3YCExXCxsdxfT9CAKn9K3iu8WLySbcELej/UXS/gEVAWQuMosi1OKfpkGAsC96yNg54gg+uyxmhcB2ElPG5BLf1ZsmfOit9uDh5Hgo5C4iDDKZqcS3rcPQi6k8OpLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LEBLUq8A; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LEBLUq8A"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843cedd129so884475f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 11:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788978808; x=1789583608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=peV0QDmOv2RpylKNsqiOQ0PlLLqXwh9h6AojzDr/wKQ=;
        b=LEBLUq8AnC3Q2wQH3rKAlCPd7GnGCapevYjMVfdmYgpYTnyjOsIvEHcYw8HSu1iEap
         Z9hfl5KzUoqnMxKtOdZnJjUxGrgBpeG+LOU0S5N/ZirRclT/TwhvHWoV8xM9HLX8U9Yb
         muQ9XvRH1d+xwjkU0JSsyUEwxBtm61ENF8rJKpon/oPDhNLSFYeg+j4eeh4FTNd5WcLx
         /lCzOpwL/D+ZFswiWUIwXU5NyP/wE7pu5wAybgMe6QRRQueabMmftyI8QQRrqC7xOQAw
         LHHx5I37TqUPYp6U1u5i7LFsvEp7rPF8vCRXWx6a7/f2Kf9lGsvNy+u9xcrgsyiZz579
         gn/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788978808; x=1789583608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=peV0QDmOv2RpylKNsqiOQ0PlLLqXwh9h6AojzDr/wKQ=;
        b=sSJo4ChJ+IVfrG6dXokPxfHui1Pa9gxb3IBPx7/NI1I+WcN0Sy+eFXvPc2ZJF1Y9WW
         aRu9BufxDbN7xRaXbvAfpRjww7KBASYu60iD52NKptAUu5LjKO4T8bbNZwklMdzGbaL7
         QKYc90SKNg+oxJW/kCPuoERng6SRVXc/RVrSTwmAfVeBZVUKRmkC0VBYE7s0/5DJiZdH
         i5ivlQP8iSU2V2JI2f3jCeqrQSkSCxT6WjOV/Na/oLs7blTzrCqkqc/oX7X3pZQdQqkp
         un7fDEwld2AQECYq2SA00DVlIBYOixWgfylGwZD/xRIYMJca5LRXTattSRazcotzvSFj
         YF6A==
X-Forwarded-Encrypted: i=1; AKwUvBxY96Tlk7AnaSUKyWjM2wz8VxaGZud8NpvPo1booA+nEUhVG5iIuPS0P+b1lCsvm5jkBB7E1Xl1vjjYtio=@vger.kernel.org
X-Gm-Message-State: AFuF++kgC6rRtdQgpJ/nqXMXDkf05HPMdyD0iuRIVTPH15hnvffq46dP
	BOgVlVIdq+/2Avv/XNVMRhZX6VTJo1VKPAC3OMIZvkVFj9PIfKtD3t79
X-Gm-Gg: AYBFou1nr7RornpV1kKmdxto5qDEcbd0oD4qsUr4Wx3qs8ylKyLV0uhbPeLgm4bdwdu
	pLJN04wH/myGabmRa+sU/He2sVGyaQASHHMLIXAPVBZiAWMnHaNevfME8OAVCUxjDq+wtVH+qKK
	fTN1QEk040f9NBd0Gexr+33tkuXxEGx4IrzNZcWD/0KBOv3dqJ/6Ik/HWOJ360ybV2rWqt1PhAD
	chNAGVKUZFZtHvjkW0H7H78d2ckdT/hGuTN9nkEpcp5GIcY1h4FUcZFgZC0RYbX11DmLKFQrMUh
	hE6qbj89maBeAuyYJytG55bmXv0hCsRoRnvPJ/NDkHPYcxt8X6FiDKCUFHWyXXuqbdtcFIdbMKz
	b4U0GGzdKQu166i4h9GuH/uC5x7y9PHLVgZVAdDxiM2ThHP+nUKS3s/jpvyi3m8yNE6V2ByWaTn
	5wlplLZM+XBx6bYByExwT5bMttDuNoQwxbBuESxpjElqVQVhIu6JWJseoAq1r0c+gaqwQI8s+oq
	nl1W89TU/1NTzTyKgTwfWGW7QY1KBP1h4mct7HwDPxJyaIFPJb5bPKquqA0ppAP7VsoG+XUHocH
	jFGw5S73Ah+jg+NWgRCRKPFpKg==
X-Received: by 2002:a5d:64e8:0:b0:485:b169:54fd with SMTP id ffacd0b85a97d-485b169576emr7617081f8f.4.1788978808281;
        Wed, 09 Sep 2026 11:33:28 -0700 (PDT)
Received: from cdev ([2a02:8071:68c3:bd00::8998])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885b1320sm44363262f8f.27.2026.09.09.11.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 11:33:27 -0700 (PDT)
From: yCduIhFgkD <vladimirkondratyev2@gmail.com>
X-Google-Original-From: yCduIhFgkD <83831960+yCduIhFgkD@users.noreply.github.com>
To: lsa.uz@pm.me
Cc: arnd@arndb.de,
	chandrashekar.devegowda@intel.com,
	chethan.tumkur.narayan@intel.com,
	dev@lengyelf.eu,
	kiran.k@intel.com,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	luiz.dentz@gmail.com,
	mahalingeshwara.chambarakatta@intel.com,
	marcel@holtmann.org,
	pmenzel@molgen.mpg.de,
	ravindra@intel.com,
	ravishankar.srivatsa@intel.com,
	vladimirkondratyev2@gmail.com
Subject: Consent for Assembly
Date: Wed,  9 Sep 2026 20:33:25 +0200
Message-ID: <20260909183325.20971-1-83831960+yCduIhFgkD@users.noreply.github.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909123416.71919-1-lsa.uz@pm.me>
References: <20260909123416.71919-1-lsa.uz@pm.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Sergey,

Sorry for the late response.

I consent to the assembling the series.
Also thanks for the extensive testing! You're really rad!

Regards,
Vladimir

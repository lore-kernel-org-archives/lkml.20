Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793035419;
	b=PwtKCEIJajXu7xIqiS0X3lq/tYPNwyntTmWC2TF5P5BOdL/yw+HXmlJna/0snOMX7w5o
	 gI4fqjvCegQJnwpTsqL30RVtlUg/2uZ4XSnVV2mAwWUHHkMwj7DuMmv6IJGvzacaYIotO
	 SSRLmvgC9MvBxMPEb9JNGD5yTIJDZwJhrzoru+S2Q9vMCodirZ3ygqneTplj818t+tqjn
	 17h77yCerfxXUaMC+R6GADtr7CwP5GEj/0G8/dq9lILYGfF9cHDjnYSxh9LOicMJ/YzCv
	 vKDYOEGikLDrNGknEIYmndL6QEHN+VqEWGqWoAbzRv8Nc3tP4T7K+GrIkDBw+gr8ZpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793035419;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=n1T4A+3m/gR30Vx1pb1IZhOjpD85xzschYt8y7rBl3Q=;
	b=WlMXdmM2MXVqOvxKpcqv2Rv/LruQu1Kj0MKQhLCmdQ0CWfmIOx8O/SJ0vCwtJCLVHRoY
	 14Fh3Fl+Ev6dAQLrWB6OpmTkFAsacX9V7Wq735n5aQsrIVzq1hbuCdOcNnKtNVR23UMj9
	 CKDKi0S2bex76vtMsDNzSLM5VhvRsNXVxCRellgH0yrMxWAbTeHRv55G+0IbpBPWIDcU8
	 TG0JU63/4arx9+bKeEAEMINJySwGP9gqGIzYfTQT65VXMP/WWNCdCqJvGe3n1oy8yNIqG
	 rEfplc+ATuYjJvy23zTZ0pLU8md/gRIYRV9yR56OZAiWfWLDhJRsXD3b2EkW9U2bIjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rMyXaWyK;
	arc=none smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6909D606A325
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 17:23:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6909D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rMyXaWyK
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8ab432273c5so26517387b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793035418; x=1793640218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n1T4A+3m/gR30Vx1pb1IZhOjpD85xzschYt8y7rBl3Q=;
        b=rMyXaWyKYgGsfxHH+Gc0QW4ZVntC/fa8j7VCBe+9xA3c/s/ZuIYxZv6cF4lEvAblI5
         AK08Hx9SAgUKWzFw+x5uQMjs33SxhnwLzBjY+db6Sv8buiq8yZDqxWn0kOuks8GDKVaq
         i3V9P7pD/PudnkLSXxfdaYjqADIl99V2BFtxwbRZS19wLR9zGBdhkyQgyrpwoKeSS5tE
         UsXR1tvqYynFgs+FN7SDWlSuCYwRKrt9qdhkE1LQE2JCJSAhevFNwuUBu0pVCqaBfe2/
         szPA4AwmpG0toQ81mwBOYEJXYLHg3uqfuFsVFD/nMf67RMyK2U9D4cry+tMO9Z/kfUwj
         zO/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793035418; x=1793640218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n1T4A+3m/gR30Vx1pb1IZhOjpD85xzschYt8y7rBl3Q=;
        b=XleRKKZTBkcDQsn8OCbTg+Bw5bWJnSZUT11xW9v9KP0OQxJgeGdntoflHE7EByEc2c
         JXhbzc9TizlZzAeqNlUJH7UQZftBq5Sj+hUsfuyixzsBXDL+BbCpmMgRTXLaOpW8ghCr
         6TVE0OX4OvejQHI5U5wrLVpnKRjGgfN4ptimfJp5FG4o0K7uDm47AF9GjZ5z1zeMbXha
         TDb11iqTGn4hrcMAydeqXWsBGHsN7kgLLNKCnvtuJr3n32+v58Qe5AsnjHqFo4H/Asj/
         guIKVaX4cFf/rBuuryv5sFB7ZB7o/lTFbLHdX/LTXw8GfgoSYBEiW/2r1hWLOtwAw6YB
         SHKw==
X-Forwarded-Encrypted: i=1; AKwUvByDuCH8e4WwWHM/OV9urncR4BF7kELezfCKk3BrH7bFfJF+E9//0iMWPqY43uYiOVbznJ6ZshlTxGA2ASk=@vger.kernel.org
X-Gm-Message-State: AFq9FYILHfpSkGzTMXm2GiZoyCnb1jZgHdls4vtlmKPL7zxW6uMftxI9
	teinLOrsWktuTFGWmOyd1enUokv9fTO5S+l8Oapq7/dOhnMeV+QcHZuv
X-Gm-Gg: AYBFou2CCdRqUpDs/CXSDcz7FFo0dFS6dIOY14nUB2MqOqEeyoMqFi36L/plY153Soz
	jGguuWzQs9AXzcOWuehH+TIwvfw6NlWrQeqZmFwwMq0DQ6Lu7tMfpWPo5EBXXxFuPUjNT7FwLNb
	TQgcf9gc3i2I0Fvp6sWcEnfk6fpgPRPn7xeQ7YROzJn0h9j7GnO+txQdk2pU4P6cGcomIcDxcJn
	D/6jSLNF6p1JLCI4obFS0FR+dGJqabY7nouQZDmzNPTbqQ8x8W2JZItMOmE9qSj6fPTFL7KOTR9
	V8oDthf9ub8LB2yRlCrwXlkaMFrdvP058Krv2UbX9ZG/RdVaghXwwbqU4Zbpz9VBOwUaGHAsaU+
	6fvmlxjNE8uoMwaVFiP9FtHrb+i2qy7dGteES+KNzaghk+UDiRDEIWuTiizoGSibknOmktPSyS1
	ZeALw778Pg4otYKbwECDYAbElugCLK0p7PjvPbNuomVCEGdcxJY47xk2iTsyHnLepm/99vIzS4n
	SYUU9wZlt9kXwrDqCpS/qybBgGCZdWt4kjIc+rU1MzTcBw=
X-Received: by 2002:a05:690c:e19b:20b0:8b0:dfcb:4d1d with SMTP id 00721157ae682-8b166caad59mr45807177b3.47.1793035418519;
        Mon, 26 Oct 2026 10:23:38 -0700 (PDT)
Received: from WillzDenali.lan ([2600:1702:7a80:3c5e::46d])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b166e9fc27sm35090107b3.34.2026.10.26.10.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 10:23:38 -0700 (PDT)
From: Brandon Williams <turbine.bmw@gmail.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Brandon Williams <turbine.bmw@gmail.com>,
	linux-bluetooth@vger.kernel.org,
	Marcel Holtmann <marcel@holtmann.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] Bluetooth: SMP: distribute the identity address when bonding
Date: Mon, 26 Oct 2026 13:23:27 -0400
Message-ID: <20261026172331.33873-1-turbine.bmw@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <CABBYNZKc1C=q_p3=f+jAVPUZd90=p4o=y2n22e6GoVX6YUq2nA@mail.gmail.com>
References: <20261024112435.247650-1-turbine.bmw@gmail.com> <20261024112435.247650-3-turbine.bmw@gmail.com> <CABBYNZKc1C=q_p3=f+jAVPUZd90=p4o=y2n22e6GoVX6YUq2nA@mail.gmail.com>
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

Hi Luiz,

Thanks, that makes sense. Turning privacy on only while pairing the
pen solves it for us, with no kernel change, so I'm withdrawing this
series. Please drop both patches.

Thanks for taking the time to explain,
Brandon

Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78458395AC6
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 15:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791473318; cv=none; b=uGZYpN9ikAaGkNXFW4zwks0kjr1nok+WJ7WzlshqtVf49q32b6Kr73Hy77ny1tV9MIrXUl2hM4r0HFyJFln0ZMrWi6MZ4ii8rHBuFw+vYMIKtOMu67uY4LuWrbzk5UfnSgIXMKiEYtm4dzQoreGS4oRkdTY3w3IR5CrfNHEMovE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791473318; c=relaxed/simple;
	bh=UduWFgcjFx26dvXZQ3b0k6+6sEMJYiOkZDWzbru0lGc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UpVdYNX+2vXVrK7RyR1GZ1zSLDcReoQue0ioEvL2UnxMXWeQQoXOIDTWRjVn41OixZ3H67fuVFAQ0oB1rqlOFj66y63HlSdja97LgT1B4S7diYW/c46hlNChsPdV0jqbn1b8pMjoVIT28wjqrfOjHEVfF1z7x7G1ns6Ds7hdE3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GmlQxgqG; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GmlQxgqG"
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6de92455c45so74983eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 08:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791473313; x=1792078113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yLr72W86SUjY28bGb0k99cY9z9+6T4+Be+J7c8ckVoQ=;
        b=GmlQxgqGUAgc2nGM35eQn3YWUUeoAgKOpSVyWkdRK11IV7f+ZSaGpP6v9a8QspEdCm
         /cto1t/QC1J4P2G9zvXYegtWtgZt9IXpiOG4S895T3o3qTpLjbhK3Z2oEZGSoNeR4t/w
         dZTWbsqnc4ZQ2M5cw4oTqDnCDMs89/IYXve6jPX4RU2LZY6rHuuknX++3QrTdNhAIShE
         lKEzJ13zaYdLXZzvBZFgqrnLZJ+Dzr3u8OOYUn9TNhkwKVwTjkgi03Oogmrx7wCozXPe
         Vvp0e367Nw8f/8w9xVwVeFxu/InblRGP/6W5TJiDzB3ELnEaQdibbQXyWLBnYOqbTZCu
         mKCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791473313; x=1792078113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yLr72W86SUjY28bGb0k99cY9z9+6T4+Be+J7c8ckVoQ=;
        b=sWe4seaeJLMRLJPpowIgt1+cx3tsBU+taToqnfCoKQTvAE64aTqN09FU50QQNhyvRS
         TLEteTiocopr6kiFNarodYYp4bO7VaEbNqCIQf4DlmoZXs82I1pO7yT9J+OL+wL9BNpz
         uYDtPplWNfUo/kUVhnSDHJp234ntOJhJ/tBmAaEy3Ad2UNZ+eg8uNCKZz0cU81H5mHdR
         ivJok4655wgKsq+YsQeoLd67zxzJWTNBT6jP7IA8cnxEnsS6pxL8Nd3yTfSCtaSF9y2V
         WjPwOiJHD6OEL8KrKdAMzmRz0wRCsXVzeJ/usNjdGuClZFjXl2/ohopkxZcfj8ASZc4D
         gmJw==
X-Forwarded-Encrypted: i=1; AKwUvBxWyuRwGLi38kNRHBhxHneXdi4wabwB61vg54NC1hBxpkicKGEQFr+AsUxRHT3A+GoXudumyQmBG0f5vSs=@vger.kernel.org
X-Gm-Message-State: AFuF++nTXFd9WhzmHusg9XmCaeZvUtQ26z1PgG1PhtRGFKfeHCJ+hcXn
	oPP2ku2WlGGOilLuMQPyCkMFhwdxeP7U9bkMDxzranQhFXZvQJfUFqvC
X-Gm-Gg: AYBFou1+wECkQaoY+BLNOcT45Bg5SaJ/f/lIa4zuJlT8Vuy/inYehM4NYxjua7bLuK/
	xYePmKciuH2Snb8X4+5/im/XNEl8t7wzE7TWoeK1YP95oKwPwtynqooD22lI6WWBw2LDUEcH+2b
	O4e0QctwfaZ073fsO/lv1H/JBPSffXQaFgTfEDxYur+hrsWqG2cTonv3CUwPbC+9ajLhR7IRqkm
	iVqDLmDouZcIpRK+JmyGKf8ry+72N0RAtVq5qwWM6PE/QCYDqUIZu/UeVm4EeeV1yaAiQRtXRyG
	S9PnbIyH7cYXQV0jepIse547w+7AV+rTNvpFwS3q8YaWK7gQ0BgWAwo5G8SjSQCQbNFQASjJc/O
	zK3fixkRQUJjoKx+2HTmBgtRB8cIiq8DMm70dp+nDE45mNAFk2OouXKgKv4gP4k0B6INvS+WEO7
	knMSkt+p7ABkTlJZZfYBzX95m/MwyabIQ0mt3DOrU06NkGi8/a2ppUe/jbjAe1l224i7JeTnJeF
	VWxDX1U3WXCvZFJ/mQlATvfn2eBbDy+Tm/EDIoh
X-Received: by 2002:a4a:d1b5:0:b0:6d4:8158:8d67 with SMTP id 006d021491bc7-6eaba1f4dbemr2277016eaf.0.1791473313150;
        Thu, 08 Oct 2026 08:28:33 -0700 (PDT)
Received: from hitalo (190-33-161-131.in-addr.arpa.host.souuni.com. [131.161.33.190])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a274aff8eesm3216671fac.5.2026.10.08.08.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 08:28:32 -0700 (PDT)
From: Hitalo Souza <enghitalo@gmail.com>
To: luiz.dentz@gmail.com
Cc: linux-bluetooth@vger.kernel.org,
	marcel@holtmann.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] Bluetooth: Don't leave abandoned SCO links up in the controller
Date: Thu,  8 Oct 2026 11:28:26 -0400
Message-ID: <20261008152826.2162209-1-enghitalo@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CABBYNZKoSV1_cVJRrdonHT=gKtS6pgoWDM3R5nj5aR0D17SqRg@mail.gmail.com>
References: <20261007154353.148223-1-enghitalo@gmail.com> <20261007154353.148223-4-enghitalo@gmail.com> <CABBYNZKoSV1_cVJRrdonHT=gKtS6pgoWDM3R5nj5aR0D17SqRg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Luiz,

On Wed, Oct 7, 2026 at 2:15 PM Luiz Augusto von Dentz <luiz.dentz@gmail.com> wrote:
> Sashiko flagged quite a few problems:
>
> https://sashiko.dev/#/patchset/20261007154353.148223-1-enghitalo%40gmail.com
>
> We need to check if the logic of hci_sco_disconnect_orphan couldn't be
> made more generically, so in case the connection was aborted but we
> received the connection complete that shall always result in
> HCI_OP_DISCONNECT so the handle don't stay active in the controller.

Thanks, agreed. v2 does that in two patches:

- when hci_conn_set_handle() refuses the handle because the connection
  is being aborted, the Connection Complete, Synchronous Connection
  Complete and LE Connection Complete handlers now disconnect the link,
  with the abort reason;
- an ACL link that completes after its connection was already aborted
  and deleted (an incoming connection, where Create Connection Cancel
  fails at once) is disconnected too, as SCO links already are.

Both reproduce in an emulator (ACL outgoing and incoming, and LE):
without them the link stays up. The SCO patch now uses the same helper.

The other two Sashiko findings are addressed as well: the legacy
Connection Complete path in the SCO patch, and the air mode
notification of a SCO link that failed in a separate patch, as it
predates this series (1f8330ea1692).

v2 is here:
https://lore.kernel.org/linux-bluetooth/20261008151238.2138665-1-enghitalo@gmail.com/

Hitalo

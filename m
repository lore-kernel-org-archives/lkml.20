Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1A73438A0
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 18:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789322652; cv=none; b=TGqthaeoz6fpDPCq8OdrweUC7Emlrbm8FKJTpLOsPoO+Bx8N9D9P4u9WOPoEJzpZyYl2kKohHGkM8wmkmS1+FD96N2z/mOy48gFrkO2ISb+upZOYbKwnRwpx03oxmKgeFay7pQO1mlDqP38oMUdGtRh2L1djOy+i/Nx5kyZhXdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789322652; c=relaxed/simple;
	bh=FpXuibbgunUKWku75TCdJBzKVddhMIdiIekGxKU8ED4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qnC6Pra0Sy7QTrig0gCaKOwuGuugap59ljLTmj2+PFyk1ItqOKzm5DrJMWJuoA605wTXx+2TKC4PWLyrQ6MjJvrUZeIRtt2qlwa+oyEDbd3jGGD8s5jSzCfUPn4jCEbgO/StAMGvNNE7WiC7osjhCmANjI53iOcRUFRdp95kZLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SOWRQMoG; arc=none smtp.client-ip=74.125.227.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SOWRQMoG"
Received: by mail-pj2-f6.google.com with SMTP id 98e67ed59e1d1-3964e7720afso1796523a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 11:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789322650; x=1789927450; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=A8Z4lHNbz+UeURqdjUe4LqKVsnHKdKejzDleunOFUKQ=;
        b=SOWRQMoG/GFtg8k5PH4k9x7bPTQZOjW9Lba7CBH9mGFy6a6/bTmnC70LbsxRFcBHmc
         Y3n9o0YyEs7KURAtLmEo8Z/dGftKqwqBxa2jVRIqIvKn6/ZUOs7d+comna7A6h14q9f1
         HNUi+VxU+wdHvKWmpyMIftHma/15Z3q2R4jlS9lr9gF7YUGWFAVTO0ovf7obirfElJI5
         4RO61gt5nKyDACzWx7JaMoBg87azmhEeCxJQ7iPSYh5149nQGyF6cICAAqk923ZuYTZj
         5+xTxF0jMnNdxuV0VDuwKFK2UDBxR21t7kH3eIbyvEIt97hDcGnHAsDTUxW08m8wzvEn
         i8ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789322650; x=1789927450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A8Z4lHNbz+UeURqdjUe4LqKVsnHKdKejzDleunOFUKQ=;
        b=UW65xLbTuHWNPBsmaPrUulvtODSxfHJV2l0Q/jH4G6l2c2vi0kuEk9jRQepmlSFJi3
         tu/wj8Wf9vkxMf7/+SuOdPNeyjoZ0DisSxq2DgZpF/ETelRm6/ZO06KL4U6nCbqDQ4GK
         atFBpLljuj/HuhW5R8Xf57hnCNLHYbfvPIpZ7aTCAXNU8NABUBBmzWy6L+3FRBOyW9em
         j9Pb19kZ3dqiqj8Cxgf5aV8twuVOOXhB19DmMQNCCxMujWBYgXD2i6yd6xYFYs4S49jS
         kwN48/fLksTFoNl7RUmCmelf2vBpgoGvBYYz0cp9DNjrx/eVNE3W+ZmnjdowSCyM6Qal
         /Iuw==
X-Forwarded-Encrypted: i=1; AKwUvBwzL5J7MCvINJU88vgSXrM/9ue4woY1ijiiT0CInEMT6fMamS496Rg4X8IptHgAyLfa9tsIXnetNgZ3eDk=@vger.kernel.org
X-Gm-Message-State: AFuF++mHG6KlzZlu8dQLXGyTOu//qw5t4NAvIWs8wb7JnsV7EMxzIICE
	obFNOllIGkU/zCtygL9X+du72/gpV1Af/3vNYwW/zXyUxg6Lnip1iyk=
X-Gm-Gg: AYBFou2MbUKtHlwoLCgMMymKybmUXCL1jLG2MRIXkHnlHWtgXmH5R+62VLZgtjEzN9I
	sYXQbRV/oDV4xxh7hwZ4OprARHp7IwAdFFNE513xt577wzkRNMiIo3wvza80pMziB2hsZDm4KEE
	QDBPhBX0smXTZ6B5/VMVYuRAM6vdXPYKOxKiFkQ24TE9YgZR2UzMb5RMr3IhNJ6IzOXIlv0XW6S
	J0k0SmUQ0VIOmT17AcejxTYcgiSlzgJqwTqUFw6TVs7qHQZ2IpFt4j8+FL5TVSTcfIDyof7fG0s
	rLJGGZXa6QSMaQNP3Hz+UcJLoLJqbweG8XbYjxwl8VCVjT++0rnZeXpvOmgxAHEr4Y5B1hm2vQh
	PH7kTznNBJU4vhHhe5aiwsAUKYxC5rfn2DH4FMpmLsklpu5XKfQIrCBjXlAI3ruHjTd8LdFn5e3
	SPrHQT8M2vtK+YUXSCEURq2q0i+504WUMlDA45IdPxCGxZku8eO8NFJ7xLacdB1k1qf9Cbq9I8Y
	nQtoKmmzLHvW8w=
X-Received: by 2002:a17:90b:3ec3:b0:398:9c00:29ee with SMTP id 98e67ed59e1d1-39dbc6f44d5mr15199601a91.22.1789322649797;
        Sun, 13 Sep 2026 11:04:09 -0700 (PDT)
Received: from murali-Aspire-A515-58PT.. ([2a09:bac5:3b24:1a8c::2a5:ff])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b348cbsm20636958c88.3.2026.09.13.11.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 11:04:09 -0700 (PDT)
From: Murali Krishna <muralikrishna2444b@gmail.com>
To: mani@kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Murali Krishna <muralikrishna2444b@gmail.com>
Subject: [PATCH 0/1] net: qrtr: fix coding style issues flagged by checkpatch
Date: Sun, 13 Sep 2026 23:33:41 +0530
Message-ID: <20260913180342.8948-1-muralikrishna2444b@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This is my first patch to the kernel and I am still learning the
process, so please forgive any mistakes in formatting or etiquette.

This patch addresses a few minor coding style issues in net/qrtr/
that I found by running checkpatch --strict:

  - Fix missing space in a pointer cast (ERROR)
  - Move trailing "*/" to its own line in two block comments (WARNING)
  - Add parameter names to a function pointer declaration (WARNING)
  - Remove an unnecessary return at the end of a void function (WARNING)

After applying, both af_qrtr.c and ns.c pass checkpatch --strict
with zero errors, warnings, and checks.

I would be very grateful for any feedback or suggestions, even if
the patch is accepted as-is. I am happy to send a v2 if anything
needs to be changed.

Thank you for your time.

Kind regards,
Murali Krishna

Murali Krishna (1):
  net: qrtr: fix coding style issues flagged by checkpatch

 net/qrtr/af_qrtr.c | 12 +++++++-----
 net/qrtr/ns.c      |  2 --
 2 files changed, 7 insertions(+), 7 deletions(-)

--
2.43.0


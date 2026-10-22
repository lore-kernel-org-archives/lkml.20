Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660621;
	b=wtuWCPeRGIBy6DaY72xlktGJY/2agLbeHPRGcIKpBpxT2f2HfyCLaI7Wl7nMzRIqc//A
	 VJWbcH4/LL95s7gXhkLl6x7GH2sybBMi+u5fOZIIlNQeVkBM/vKCGgLozLNbXX85JHW37
	 Gnqgwkrr2RpqrRhj7Yu/73+z7nIpvLvckwwIelASrHqeXJRHyXUmwI2VWFG0ymGCdnWac
	 tm++XTZf1wq1vyo2pcKojFnsjsuqg58C3cbcSXAjbflwhh0U7vHBmRTfsWNFPoZjGfJ4M
	 EFS2eLShOSSIWbkh04tdsrE/nBl+9Mh1NpG5jFyp7ibcgl3j1LGiGszrOj9ZFKpoUaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660621;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=74Vw0j5rE4cQu4U2NNcGbj29GdZNeea1qUhNAa2u8VA=;
	b=xgdwc2WAxw6bpujRu6gyB91hKgeIHB8Iw+dxkVZxHyrUTcJvLtXEBpGC8RUEC72cQXUg
	 fwoyKeGkKAcw19n00MnOrmV02jrkRRXurQ+icIENvN1wSrRGgzXXXL4+54Vb0FhlU49w5
	 QEectp7ahpIm4tXJ7jn8KIwCpDs5/+D8ZOCgHaT6tkrBcH1lw7ycswf9PisVXXHK3xfhY
	 z54mUwTYTMF2cqhCHIKD+eK+BBrx7oW/E3iaDfuwJ9rUI/jaGETBaeVAok64zZlWSxQIS
	 FMSXvymOtgQJmZel1ugI0sBhpX3mMJsr+4GZY69eoMk2/RRQuxaivdSYp1kheAyC73Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hBhy5ypY;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FD0606A31F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:17:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2FD0606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hBhy5ypY
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35943f55c06so916695eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792660620; x=1793265420; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=74Vw0j5rE4cQu4U2NNcGbj29GdZNeea1qUhNAa2u8VA=;
        b=hBhy5ypYXncRiYmIbapRlcQE46DIqBPNYMXjj0YperJhiElOGSByawpFQkZOhrd7ZF
         raidv5wjumP0e+/xF4C8bKZMhpNOKrzmgJIThRFLCzjxuNiW00QPwAvaOC9ISYsNS9uH
         wef0d8VmA/Adb3Oz3F5S6EwsxwXPxemesi7Ni4pMdinKMOdZhmXh8c9u7EV3Equ0qz7c
         ey2HLceyg8SmILm64uEFz6DdoAAiggL9yJz5RlNSoGX2IebOli46rAstSdLDm/bwhi1K
         JE1KuJQtwDh40tlsY8ZlERp8KTqHrlU9d4oyvcEoFbXnow72bOPtpW8JzihTBqwy4xqt
         FF0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660620; x=1793265420;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=74Vw0j5rE4cQu4U2NNcGbj29GdZNeea1qUhNAa2u8VA=;
        b=Eg0/CsAdZoNCAAAri9KmXMZaahvamVXd0AZIof/ACuXDBcc6yWLsYrwEZ0BW9TBcQ3
         wsrXDExeerFs2PagyyQU/OCc1Mx7ZS9MLqCRwaxJ7KZfBwbni7I0tFUzPm39fBcsw/pu
         o1S6QxksIMuJvBrblzn/UnrxnimC2lVRb48ycFzZ5/idL1PmBIng0vDkZS/azM8NqD/8
         SYm6Os2eE3gfB67ZkXYtH/vYqRrhOEZUxrTTeZFV+SoscxGCzXY54OviVaNaaHw2d+JW
         BaECWjXViNn7X7zymOLWvG/7h5gOZCpG5xRjygWI5BdXSgB1EPjJiRBTLF0919qNSv57
         xkRg==
X-Forwarded-Encrypted: i=1; AKwUvBwMgp2jkM/u9ief3SrSxkR9rttLLe1Gm4NbyPZYtYlDP4zk5s7Ze8SOgtozstO9JwlQsULTMeXS+lxABfA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFDXkemi/852BQ4QXafAAtcCX2HdMNy/d9hXQfTmYvQ+mIEZHE
	2EIFP3v5AEYqvNKpl9EZXd/HMLBjCXasIYE6AxV+cv/0z5pUNpsTPR724wlICf+d
X-Gm-Gg: AYBFou246m3PcNIH6hAxHRVA7iB/gc49QUsfN7pjR9fEI+HWSuq8ouP9yx2aC5sbcbO
	9E013qVLe7hq0rKbh9QDYGGx8+I9LyhiA8D04w5ZmXt1PERN8HtY7rutdRNTgLNWrIlgBf/1e1q
	zrnYixjyFWghYGTtQEaboMWJuWflSAOduLU+9+xVc9N0x+k6NrUsXtC48zfR0qa/SQ7EbgVNDyC
	tYtskpRfEnTaB7+S53O/XiDKJ/XApRxNo4VVytuQTrzUwCzqKIA22zojNUjU96gUgyxKeNMZJp6
	Wp8FE+afeBRbLCrOAsP+dPybCkou3IUG/pFE3zgvxWI1zHN9UN8pH9lPwhC26xh4MqVZ43tdY6H
	eo0X797vkHHz/+9hWAKNKVeLSFoMH1tTNjhjHxPelCpnJB6NxWASGzGX7oXL/LS3TRG1lAsOfaR
	6xI/QwppcOL9AwzyHoxOT2lhBwAsaLs5fozfgeXf0h9iMqvky1z1q4zYVO+SaIYYb53Yq22mcC5
	81IaxmY9ArE5X+JwAIB87ENhB77TO5yUaUKoSRy0F5t6UsWe6BLbGeEoK2fJZLme61JvvuaeArX
	uQpGcAT1Yi1uTVBuTg4=
X-Received: by 2002:a05:7301:7e17:b0:366:6c79:212b with SMTP id 5a478bee46e88-368b122ff22mr2280564eec.25.1792660619861;
        Thu, 22 Oct 2026 02:16:59 -0700 (PDT)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8439sm15295791eec.11.2026.10.22.02.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:16:59 -0700 (PDT)
From: Cheng Yongkang <teel4res@gmail.com>
To: Nikolay Aleksandrov <razor@blackwall.org>,
	Ido Schimmel <idosch@nvidia.com>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	bridge@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] net: bridge: CFM CCM transmission state races with delayed work
Date: Thu, 22 Oct 2026 02:16:53 -0700
Message-Id: <20261022091653.3652341-1-teel4res@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Hi all,

br_cfm_cc_ccm_tx() and ccm_tx_work_expired() mutate
mep->ccm_tx_end and mep->cc_ccm_tx_info.period without a common lock.
The start path also queues ccm_tx_dwork before saving the new
cc_ccm_tx_info.

One reachable interleaving is:

  writer: store ccm_tx_end
  writer: queue ccm_tx_dwork
  worker: observe an expired end, store period = 0, do not requeue
  writer: store the requested nonzero period

The final state reports an active nonzero CCM period, but no delayed
work remains and no CCM frames are sent.  The keep-alive branch has the
mirror interleaving: it can update ccm_tx_end and return success while
the worker subsequently clears period and stops transmitting.

Observed on Linux v7.3, commit
08ab31164c55f20c7a2653de3186ae333470e2c1.  A self-checking userspace
program exercised the start-path ordering and found six phantom states
in 384 attempts:

  start_period=67108864
  probe_period=12738873
  two readbacks remained 12738873
  keepalive returned success
  final period remained 12738873 with no pending work

Four independent snapshot-VM boots produced 98 explicit confirmations
in total.  KASAN and UBSAN were clean, as expected for a control-plane
liveness defect.  The target lacked KCSAN, so the report does not rely
on a KCSAN warning: the queue-before-save ordering is directly visible
in source and the inconsistent externally visible state was observed.

The worker and configuration path need serialization, and the new CCM
state should be stored before the delayed work can execute.

This is distinct from candidate BR-038, which reports the 32-bit period
conversion overflow in the same state fields; that arithmetic bug needs
a separate fix.

I found no matching upstream fix or CVE.

The self-contained reproducer and complete logs are available on
request.

This was found with a multi-agent workflow; the state
mismatch was reproduced in QEMU.

Thanks,
Cheng Yongkang

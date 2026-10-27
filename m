Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793119486;
	b=NRLQwY+g63uX0apEEbfyFEmYJOrzEu44ZC/9e8tUJa+ITvMENfU1aMZkfJ1Oe7h9PK6H
	 SPxCPmbVy1rVxF4d+eL/AR12bVLxLWpJ7hEVakFFcacnDkS0sK5K1AWL3vZeI0dsCX0MU
	 kTuAoB2TZAUjphtRm5QcStApKofD5RPek/YHU1pIC89bViuutIr0KwNbDncg1ogO9Ya3J
	 O238UbNJ2wsk+m3AU2tvEyQMic3isLFbbKcgCVS9y7uEinqSWnC7Ud1xtZUEhdzpbvTzE
	 w8VKA8se87tUBiD/f6GpH7uSDiBRjY87Mt7CWkojmfua1l8dAjEjVUvC5eWsC0WfQPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793119486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=jR3pF5DlIFSpLhSY083BaZUgI2YoO9j0dr5wABPC09c=;
	b=OjUpbTxTTU5PZP9Jbq56CM94jNx0t2oBzNiYH+c/w8CwlOYy3ttSo8pGHfHEO3IdhSeI
	 nuC+6cXFXRAGVpHIprmD9laKsHqfmJri1j3+OwnO7lVviYmvAaTj9aBkqJksjaEqzMA1F
	 bk/M2CWkkcXVG/EZvWIlCH9wiA63VUYsjrFbnO9Qt1FyXVQOrL/6+1+Eh3isWI6gRUmpD
	 HqeXc0jtdFNt8zxtMN9Ta/c+bcJPqcukvQQS2CNq3vS3fY48JdEoHzG82x77x5pX4+v46
	 VxrlUIolPsX0vlLQ4/Mlvv+dggSrXKuex/GgNPc/sotK7YkwqYqLcamTNEQ4DfTVl6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fqxo1a9W;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4D7606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:44:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F4D7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fqxo1a9W
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6d68de53053so97374eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793119483; x=1793724283; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jR3pF5DlIFSpLhSY083BaZUgI2YoO9j0dr5wABPC09c=;
        b=fqxo1a9WYTLm35LUzESPRP1phpUhVNHIyzUzG02eCj5qTk6apRaLImxXPPUdv+zK2t
         hYC0yi0zhA/wvFcpeQCUbmHe7iAHO/5t9c5kUz36vqCt/j6RtUsaql4IGIOQNZ1hoyT7
         8O4nVtMD3dywGwWeiCKv5fP+gM8iyjOOpqznM3/dF1OHw6EKrQX1ZtNAfyCGPNdHu5Sh
         Cfhd0zl7ycSOQbXEgdglCTShIcwn3T50gT5e3HVTE7KiU59cYr0lFEioaVCI2NYSusI6
         ErvgFgmVs3bPkQ9PQAU42mkc6HtBcLLtA6EucepiP+FV+K2rqnes0F2OVnZqCf6tYSlW
         8ufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793119483; x=1793724283;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jR3pF5DlIFSpLhSY083BaZUgI2YoO9j0dr5wABPC09c=;
        b=ghtxzTFz5zU6XetqJNNltMOcGYhOe1Q67tCehp/+1/laI50cQGsJyEJvR8mrX7aVf0
         S+xF+z+pddFjcBLnFFujarItpj8yBXbL2qU/HOpHMdbdVuXNWiznb526daYqBI7ycqDF
         ckOih9LBZst/88Z6qYEWRDQG0pvyJ1uo4d/rP4+esVR7IC7TOrg/buuukB8wUVjTN2aw
         j2Nh7pNMwylWrmUmC47od6VWqImwVzExgJYRLWLw7+4zWTQF6J76o+3/nYzylV8LkFMB
         3rH21WPqxj0U23OxPn7fS4czebl3Yf2hiZUOFQgDz48ZfAp27tEE9PAysPLYZGaq5QMa
         A2lA==
X-Forwarded-Encrypted: i=1; AKwUvBxmGmlTy0Hh8/rsxMLdD9xs/qdmoO3Hm8sLUbOKGVl7PCjPmfKFv0xEVb3UfSvNlAE9zhgEYkJ6DwhBPbA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLG/dG6R0rLNx5C4pNf56P8IS9FzORD53uCvVL1TvI1opOM0tfv
	MRDkpg+5iRMoklCyiD+LkvRkDKjGqg2YPOzIZavk5i4vLhCwfpp/E8oNCnuhKoXqoRKkC8MYxhj
	Ytk0ys3k=
X-Gm-Gg: AYBFou15suZCbFNuzGjGu02y+LHRHFp2Fw1JXJaZUqnqeDfJozSbolvjuYH4RwvT7/e
	uWJ0hqk2APhOjtj0yvj1bIBvtxhcVf6rPQ4J1Rd8T7f2mzHgMPkt+S/DWS3MUeUMwy4e1EqhsRj
	osnhyeqm+vu2yC060EM+LPLc0TSOiZcnkFzfNKAUPrlm+Uf2xiH4ncTCTJXqir4SdHogCRnZZ3p
	6StusDTUl4JTqLKCxjxP5kCfjmy32BtkeZQB193zfOmjPZTgd3WuPry+HC9BDj6aRtEKCaeFmS1
	SgrnCmsF+BVsjKzpS/HZV3ijHa2Sm4tqdH3D+QXxX4pbMF7sljngvO7+9g5yUfdKWmoR2mctLH7
	P7Eo18VRZ4G930wyLPC2IgzaPA8zcOiTzkjDiNaX/bjplB+7O/mseWmk78r0gd/zHzNmke79ncc
	jwZQco/jeThIxVXB5lLP8/fpd+C967fPWbDfKmM/BPsOw3yb7JEperd4suWuSbksd6yJQDQyujg
	zKS5Bjt4+G/w/i6kSNbk3mHnRozf8BqONbdktB6sFJtHbr+8l8adsyFpiVe7i0y0bacZmyScApt
	W2lAgX605mmadADybQqUyZV3gb4CSIyFJHHF
X-Received: by 2002:a05:6820:1629:b0:6b6:87cf:d1dc with SMTP id 006d021491bc7-70ba0dcd59cmr5722664eaf.24.1793119483372;
        Tue, 27 Oct 2026 09:44:43 -0700 (PDT)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70bfa90c943sm7618088eaf.3.2026.10.27.09.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 09:44:42 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Daan De Meyer <daan@amutable.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261027-b4-io-uring-connect-eagain-v1-1-f4e3aaaa49ee@amutable.com>
References: <20261027-b4-io-uring-connect-eagain-v1-1-f4e3aaaa49ee@amutable.com>
Subject: Re: [PATCH] io_uring/net: don't retry a non-blocking connect()
 that fails with -EAGAIN
Message-Id: <179311948242.964136.2262085324990415486.b4-ty@b4>
Date: Tue, 27 Oct 2026 10:44:42 -0600
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Tue, 27 Oct 2026 16:09:37 +0100, Daan De Meyer wrote:
> IORING_OP_CONNECT on an O_NONBLOCK AF_UNIX stream socket retries a
> connect that fails with -EAGAIN because the listener's backlog is full.
> Polling the client socket doesn't help: an unconnected stream socket
> reports EPOLLOUT and EPOLLHUP right away, before the backlog drains. So
> io_uring retries the connect until the apoll retry limit is hit, then
> punts the request to io-wq. With a full backlog, io_connect() runs 128
> times in the submitting task and once more in a new io-wq worker. That
> worker stays in the task's thread group, so a later
> unshare(CLONE_NEWUSER) fails with -EINVAL.
> 
> [...]

Applied, thanks!

[1/1] io_uring/net: don't retry a non-blocking connect() that fails with -EAGAIN
      commit: 71537ed811107c514c0342e98902d489d6d2b7cd

Best regards,
-- 
Jens Axboe




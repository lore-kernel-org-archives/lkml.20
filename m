Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793179675;
	b=OK5516WuwLsxh8iUe+18ULVwx2kDi7//u8kRIgEEw+X6z/zBqOG7DyWxAUSsY/7WDC5M
	 ws+tLg/KeUveEyxMxvROkgvpZnzp7ZUBPW6XEfCdhmfGuWzmIORFr+hwPk0gj3vFtVc6L
	 7EuhcotsNPNYd2DFQx/A6EHC6xEXcJr/YeoAoWfPa4YmjIMRw7faFh4o6yIT9xG37hkwH
	 gaAuM1EPO4prS39Z4hPH43Tn/UIsTDDBUuBhES5uQ5VfU+2RHpp8tmG42Qc+UgHVi4Tp9
	 ceVabYR6budvSmszhUp91k/WGrbePsmUcK/99nIK2/9K+qWWkpANhLxgehalRRIHtsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793179675;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bouMHOZSYgktXg+3k1sBjUJFbdMKRcN5fIavltsJbIQ=;
	b=v1yLcbEIV0S2A7g/TTMK6MTyxjHro1lcD159C2gvB8HRUrlyoYH0Jr5VAx5G3DbkoX1L
	 rAuV48HwRLUZZU2UExyFD6gEO28+nDaNlmguMESdKduspY8tqdsY5PTVN7vKAEYhJU15+
	 y8FOVUq56eSuPQC2xEHP0PG7AaVFXt4hCC1b2l4Lux9Uy3f/tDg7YZX/UxpZhM2jwuFxH
	 PjACzHdgve8id+/9XDj/1RjqX2dmmfjtH9/Xx3Lnec3q17Vc4Fr84oMFLXSg5R9jMKSkq
	 GAmvIHaEl/c9tre9oXSKMw4IriZF0eFYF3nX/UALUjFv/k+uESjrr8tdbTOZEmmm+wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=smartx.com;
	spf=pass smtp.mailfrom=smartx.com;
	dkim=pass header.d=smartx-com.20260707.gappssmtp.com header.i=@smartx-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HkT6Z9AT;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383AB606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:27:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 383AB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smartx.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smartx.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=smartx-com.20260707.gappssmtp.com header.i=@smartx-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HkT6Z9AT
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2182760eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smartx-com.20260707.gappssmtp.com; s=20260707; t=1793179673; x=1793784473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bouMHOZSYgktXg+3k1sBjUJFbdMKRcN5fIavltsJbIQ=;
        b=HkT6Z9ATlZ4/CzSh7Ji0MN57JsIxBOBy4cvDy8PvXc+Y5WfuXqh70XT8sTmkJ0uU2t
         +/HYANh/hInoJqDVpTGf5vuEzDq7zZw15gDdS3fe0uODgCNGxJe/zjOyObQU7FSW6we8
         QThXvKtD8gjh0BWI8pDo8dozq182RSn15XojUtDjC3jCzYvDdmC4obSD38cufXzqrsJm
         UUBsFVoI3MD5nQjLcmTH+lP45oTTRcJ8xtp/w5NbS69fBL0LYC3X+hulLvbhilqWg8QT
         iOJncHtiBKgJvZtPPXiYkwjHZvvl9e/SyvNDnpkzPuEKZkC+sIo0bAJVTfSoRno9zG5d
         BRwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793179673; x=1793784473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bouMHOZSYgktXg+3k1sBjUJFbdMKRcN5fIavltsJbIQ=;
        b=P28Y82Kb51flMIQljfKFPGidXbZTK4+q1w89/hjfQh5xjQ+s1IZ06eGBKYs3EtHdPJ
         eIGX93PP/pGjfS4jr9yN8HVzazkDiEAn1LwGRptKPq1IkPKs95le6AruZyqYihf/bOz5
         PkwO4ERC2DL8wZKBEcetByAjicwlCZXKVcto/2Td6jKaS/Ow0wc1ietyYdwwWaC0M0NC
         fc3+o23hJX2ZUgG/Ox9gXA21vnb7hqDSaKwdrzqhyC6esfKlosPUKQcYp+THSic+ct+s
         00Q1XPyNf4A5upt5F/Yiy1LIJdLpaGFCU08IULrRmSCya/1/p9UvSOUXTHFfiAqbGN/e
         3jqA==
X-Forwarded-Encrypted: i=1; AKwUvBxvEjZ9Rd4KuZ7zi8f/ZHwXTyX6a4pyWlLg+J9/3j87f4Pklb9p56L8srKZCJTgKhTCN1kb8Ad7PfOOup8=@vger.kernel.org
X-Gm-Message-State: AFq9FYI0kQ724LjqLqm/6OqtbMUs1DcWsb4EdY0avtBVNXLEK+yOq71F
	grCrZ5PFpZrK7aBfxqA2nH8K/C5TopjpbjBG1WMxaAgZu3Wsl59j9CpyZWx2IGd/fn6GBalS/Fz
	ycFC/hdwYLPL/IXt0efMgIITUzeKUhHKJGnlrd4K7o1GIiEj501w9LRawoo8=
X-Gm-Gg: AYBFou2Z1ZDyU2lqpKjpjRjfUTjeSa6HGsC78zwR3r67BiT3hMNvyQhAhBg2rywO57J
	f0+JA6pZdVVZVAQ67L7h3MKW926dAy58VMt4hT8f+wQ9usrra/PrBXgZV8657s08Cer2UeLyLG3
	p0BdcoHpdCqGXKrNXkJhzSOF+Zcqw8JXzC2ieWIp3qcLc4GB4DwqaBCapBPgQuKReP5+V2AvGKQ
	9mkbFukqCfjnSs+/FF/8FGfL22TSOOJuDM7u3MfDkE/DJILdN3aByj4s/wSYGvQAIECmt/rwhnv
	RGejLiIGuOjRNz2Ef5UhF5SDUPEGWj21s7fj9sWHDvvRRFOjHmDrfBE5UcM6b1i3SjttkoiHqLt
	NBkQ9geRG4Xwu4nE4RtKFqAvq+bPydMLqg1yK137DhEu87j4gb065QH+nfA20jl3BI8wk4tzxdN
	tJnjw1DYlV3oNI5/NWFWEQrxEnO12DzHncBFNx39VYXCYFXVFvKMEj9MkmyOUS1g3BgdGWUz7W7
	0aUn6qOYomXMBUgM8D4vPQBllyrdfhdx5v3tQWrj6nj1890cfdcgL/ngm1zGeinyLcPPpUOVBu0
	EIaExSF8VeiYP4kmqezHbozWzAo2NySkgHT9hCxo//HUdlLLaGEa8Oy7lkHbcqk=
X-Received: by 2002:a05:693c:88cc:10b0:366:6644:2839 with SMTP id 5a478bee46e88-36a202bdcbemr2987407eec.3.1793179672818;
        Wed, 28 Oct 2026 02:27:52 -0700 (PDT)
Received: from localhost.localdomain ([23.148.204.241])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a238dc80dsm5309669eec.9.2026.10.28.02.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:27:51 -0700 (PDT)
From: Wang Zhan <wang.zhan@smartx.com>
To: netdev@vger.kernel.org,
	Eva Kurchatova <eva.kurchatova@virtuozzo.com>
Cc: Wang Zhan <wang.zhan@smartx.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Sabrina Dubroca <sd@queasysnail.net>,
	Cosmin Ratiu <cratiu@nvidia.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	linux-kernel@vger.kernel.org,
	syzbot+c6c86a1c56b5131f2d97@syzkaller.appspotmail.com
Subject: Re: [PATCH net v2] net: fix self-deadlock when an upper disables a feature of its lower
Date: Wed, 28 Oct 2026 17:27:20 +0800
Message-ID: <20261028092720.1062867-1-wang.zhan@smartx.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027140121.1192299-1-eva.kurchatova@virtuozzo.com>
References: <20261027140121.1192299-1-eva.kurchatova@virtuozzo.com>
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

Hi,

On Tue, 27 Oct 2026 16:00:49 +0200, Eva Kurchatova wrote:
> There is no way to tell whether the current task owns the lower instance
> lock. Try to take it, and otherwise leave the job to netdev_work, which
> disables the features the uppers lack under the lower's instance lock.

We may not need to tell whether the current task owns the lower instance
lock. Instead, we can check whether the device is already in the current
notification chain. netdev_features_change() is always called with RTNL
held, so we can track it with a global feature-change stack, like this:

  /* RTNL serialized */
  static stack netdev_feature_change_stack;

  netdev_features_change(dev):
          push(netdev_feature_change_stack, dev)
          call_netdevice_notifiers(NETDEV_FEAT_CHANGE, dev)
          pop(netdev_feature_change_stack)

  netdev_sync_lower_features(upper, lower, ...):
          take_ops_lock = !in_stack(netdev_feature_change_stack, lower)

          if (take_ops_lock)
                  netdev_lock_ops(lower)

          ...

          if (take_ops_lock)
                  netdev_unlock_ops(lower)

> In the deadlock case above, the lock holder is the context that sent
> NETDEV_FEAT_CHANGE, so steal the pending work at the end of
> netdev_features_change() and run it inline, like netif_rx_mode_sync()
> does for rx_mode.

The "otherwise" path takes only the instance lock for ops-locked devices:

  netdev_work_proc()
    netdev_lock_ops_compat(dev)

but then reaches:

  netif_sync_upper_disables()
    __netdev_update_features()
      ASSERT_RTNL()

ndo_*_features callbacks also require RTNL, so the deferred path cannot
run feature synchronization.

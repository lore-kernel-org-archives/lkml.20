Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C59047F3AE
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791961388; cv=pass; b=rjwMzQN/mRpvDMa3YKAu9WNmEkFhxHboYUjOkQtRAlRLDdEaM4BHluZCPz37Mzh4eQCWFedkzQXLm3LBHxh/QzAkGD7kzrmbTswb2LY2+5ATQCE2tqz/j93/cLNFm/Uy7gWdIZ8Asmmu8Bggi8CUot+ZzLiikZjOPexOqruOWc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791961388; c=relaxed/simple;
	bh=Ud7d+jdUaru10b3HibIT+ZW62u2wMDg2Dfm9yphCSkg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KSjTpwZ0OccR7Euoowjl/hzSf9s16wjNDc71b7pAsezd71KLB4wOH6ZpWWZiP0foSQ6Qi2OAV6z3t1JAo9su7ykqYa/ThJStB1hVm16Co/MzorRBMfZ2CetpE/pJyBEpgMS5XDJU5QHM4g7Tnld7vnUCfEWgBEjXPdCDYNwsMbc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gB9c+slr; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gB9c+slr"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2df8c28a0b1so17957455ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 00:03:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791961387; cv=none;
        d=google.com; s=arc-20260327;
        b=V+8pRvBS+VAOGbwoOyQugX3S641yuc6uWZP+LDzJZ8Ss+alYkItSh5D3FoWERSbJWH
         DyaBwbTpIiIdfMhYE6//tZKh4qdXZEKfdjUfnrpXysL5Px410MYOw1RygYU5eafsRBxF
         c7E68KoyQZn3a3LCMqoOE79xU88ywaKOYYPasHBkl3eRC2XKzNiOtL/DiuJvngu8oXWp
         43KY3vLA1WVAifCRbjVMDjKIquho6KzNKAISd0v+bTIj0Na69uJpZedFczkBcBaUp0+l
         VD+GG6QyLTd+1Wo0blm4Z/3eQlr5Z6+j3D2EH/E5OG3jNfNSTvC4/CZaUjlW2bP9hY2S
         kK8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0MwlNHKdSo4nXnWLlQ4Dp9Xnk4aopVocSeJ4O75TP8Y=;
        fh=KlenCpC/Wt/T2JTodZpP6Yx7cc1vMK89q5lxoAZ8G8w=;
        b=hYZwPCMIppzuWtKYaItyhotXjAfHvMN9c/1vXn8Se3J383BzwoBaxQAnRqMDRXHMSA
         ZFl3aEpSeKpC3VOhAAQQAt9788qHXLxjKSwcxtDDGDVFSInn4Sc09CifbIwBGCEYuDER
         i4yFng10Dy676BCEvVOxDhc9S55qYdc2uP34XH8DRCiCzdNh7Eckq01UjwM2yMU7V9p5
         QfIOhz8z+EfhecFU4zvpMFa24eR7hf8RIenqcnUdqiFSvqecqS5meTkUAI4Q2t/HfWHt
         N6CtqyOZf2TIy0vwutLXolXkwUN0SAIfTpXGOCbcA9Sc+0A6x7fYx7R9GYpE9sMcANTf
         45dA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791961387; x=1792566187; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0MwlNHKdSo4nXnWLlQ4Dp9Xnk4aopVocSeJ4O75TP8Y=;
        b=gB9c+slrhil/FtEFcs1bjGlNYtk1PVnXTWvhUaaJYolKcvS0FgMC8g5d1p4KqhX3ZQ
         UKtbBp8UFJZV8ArUMYe3h3HJI8dH94v8/neTpUSIG4FXYWeqGp3JERJduphOcVO4fyOE
         Ip/8BpZ+eFPXDS4DRXsrB2RiZTJ9BcAEnDGt/brx2AhdCgh+bDy19VtSrMUCNyTBS1hu
         ry3UfqsfRR9F40QoyoZMmfmaKWvUZ8phHbfhpGYYwYiGQ2Q+bXH4fkNCWUPdZ5JDC8FB
         BF+DsDshiPelc1D1Ed2GDkuTfzbadTg4KypTeDzChjun0ytC8PSHMqpzmY14bPGPZg0+
         YMbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791961387; x=1792566187;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0MwlNHKdSo4nXnWLlQ4Dp9Xnk4aopVocSeJ4O75TP8Y=;
        b=FYbvVDeShPkNd+O4SWQN3qKeqDHkBC11dcccwd/6tPOYkaj8gFSBhLoqhQS5ZNX3El
         iIOjq0i8ZK72B7uRTEgT+oXD2MCMdVnqCxK4mX5ayDepuQljQ9iMq+f29qSwUjN3zKDi
         3V6qMpzi8RhIjdXu9OHXgRizadD0njMlQu0sJMr5c4X/vEex6jRwrZo5pNnyzWFb3xhV
         6tL7BNTzENKQvIfWQRnMu5r3glNJGSwbidBieyHpVvseEfzmBRZWqTyLTia11JYXPqyv
         YBay88oaodeFZryaRk3ptfAi+COqy5ETkWsZL600oW7qyYLY5MAFjuAxRnMVx+3+96Yr
         kEPw==
X-Forwarded-Encrypted: i=1; AKwUvBxi/6gCYm9HIiquQ6bNiS0ZbU/u39OkqS1P3kxUE8t98SEZfOlQlBfFsFn9kAvHxCg5nQB/AdZBmp4s4OE=@vger.kernel.org
X-Gm-Message-State: AFq9FYL6wMA19P4L3CNn6LLa3sTjLu4ZqEizbPcgjcC+7SaI37V5Zvem
	1ce+xtvk6tTQuL3CFmxRmKW/Zz98+nAaZoOguLAc+YfH91v/WjB1KS6YRDpelw1kA//hJKvNNvO
	ArmdWVgYdAQGuzJK8xge0dDOuG4kjnRA=
X-Gm-Gg: AYBFou0+vMA1CUQ2/5WrOvXCZxSFCAEtANlvveAu7/Fmg1n/JYcsBxRxr1HiRN0HAdC
	shmjPUtRdjeYMhxM0KP3OiJCuqF+qgrMCjDkHjXS/WEv/1PQ13iws5dlDVMUVG/cNMCBR+zuPw5
	2yntpcVaH4tp2LobsXVCQ/kcUI44TO4r9II5Mi2WrbT8NGdBpnM859J+/oOAfF2q1jneWLjinJ+
	ezVYTU6X3uPo39c2tn/k3zywPOb3C7Psaq0aCfRp1Nn8cyDelWxE7fVQj0wahXzkfi16w6ean61
	b4FC537OhT5Mh65OK/Cj8EisvzpHmkdSQN93pDUiVibZtgrGr3otKkVknZ9uS5Bnvm4XvVGSQjd
	CK6DP9HElVbGD2fiVn1UilwO21CfGrdGFxtd/SVgohcHv22fDqQQJOxXpBbz8wdhHv7roWVzqlM
	UZEw==
X-Received: by 2002:a17:902:ef44:b0:2dd:c100:7cbb with SMTP id
 d9443c01a7336-2e842bc6930mr116984155ad.55.1791961386763; Wed, 14 Oct 2026
 00:03:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007104731.507647-1-phucduc.bui@gmail.com>
 <179154290727.434549.17639920596465691112@kernel.org> <0040948f-abdc-4967-ab76-02962e813dee@redhat.com>
In-Reply-To: <0040948f-abdc-4967-ab76-02962e813dee@redhat.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 14 Oct 2026 14:02:55 +0700
X-Gm-Features: AclHuK-0C-Rz8o3BhYBcI4Pmv1zXl7KQ4Jjg3YkRJFwwpTufB6vgECVvJcL4egw
Message-ID: <CAABR9nEMcLxEAMCJmKGXzbbq50QGK4vHf30f5JpCc2ZVVvnGAA@mail.gmail.com>
Subject: Re: [PATCH net-next] smsc911x: propagate reset GPIO errors
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev-bot+sashiko@kernel.org, steve.glendinning@shawell.net, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org, 
	kuba@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Paolo,

Thanks for looking at this.

> > - [Medium] net: smsc911x: clock reference leak when regulator_bulk_get()
> >    fails
>
> The above is IMHO worth addressing.
>

Agreed, the leak is real: the regulator error is saved and returned
after clk_get()
has taken a reference, and smsc911x_drv_probe() skips
smsc911x_free_resources()  on that path.

Since probe fails whenever ret is set anyway, the "try to continue"
comment is stale.

I plan to respin as a 2-patch series:

Patch 1:  returns early when regulator_bulk_get() fails, so no clock
reference is held on any error return:
--------------------------------------------------------------------------------------
ret = regulator_bulk_get(&pdev->dev,
                                        ARRAY_SIZE(pdata->supplies),
                                       pdata->supplies);
- if (ret) {
- /*
- * Retry on deferrals, else just report the error
- * and try to continue.
- */
- if (ret == -EPROBE_DEFER)
-         return ret;
- netdev_err(ndev, "couldn't get regulators %d\n",
-                    ret);
- }
+ if (ret)
+ return dev_err_probe(&pdev->dev, ret,
+                                     "couldn't get regulators\n");
...
- return ret;
+ return 0;
-------------------------------------------------------------------------------------------


Patch 2: is the reset GPIO change from v1, rebased on top of patch 1.
The "if (!ret)" check is no longer needed since the regulators are
always held at that point:

--------------------------------------------------------------------------------------------
pdata->reset_gpiod = devm_gpiod_get_optional(&pdev->dev,

       "reset",

       GPIOD_OUT_LOW);
+ if (IS_ERR(pdata->reset_gpiod)) {
+ regulator_bulk_free(ARRAY_SIZE(pdata->supplies),
+                                  pdata->supplies);
+ return dev_err_probe(&pdev->dev, PTR_ERR(pdata->reset_gpiod),
+                                    "failed to get reset gpio\n");
+ }
---------------------------------------------------------------------------------------------

Does this look OK to you?

Also, as the review suggests, both patches fix existing bugs, so I'd
like to add Fixes: tags and target net instead of net-next for v2.
Would that be fine, or would you prefer to keep this in net-next?

Best regards,
Phuc

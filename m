Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6793BC673
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 01:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789781164; cv=pass; b=UkxVp1DuhtLKf/TTCF+RniWKeDeu9gJgnBprprOjNOmtkjIvjh3uneT/1Ot32UaQ+R0RiAs7rGJIAUtcP0cD7FBslNjzQWT/XVu1mnEideT2Mc0zsasUv0eQE9qOvP7VtxMMqHtcVO5z0Xi1XsrWrtkVXudxL2jJIyanmBcSTow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789781164; c=relaxed/simple;
	bh=XSgdQN2yictpDS59TUHTRXPj7NA5/+Qdu1X4xC4oFhw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bou+MxIfiNa19KbuFmLi3QV+u+8tKtL4DytJljIk8tPxRQMn3aNLOrxS+yqxGqkya1+OqyFZKrq4gZ1WkfyOaQ9wA2Ff2Un/Ue6WkJganCJkBpnHx23Udhm6HTmGbdB2xsZGraaYjRf6eyrCexsPpq1OG668JIn482avePiEIIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IFlcyJbK; arc=pass smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IFlcyJbK"
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a58fef219fso5380841fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 18:26:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789781158; cv=none;
        d=google.com; s=arc-20260327;
        b=ptWrIpbann0IBe6/5XkXgE7yP+orCaAfAwlogfvPmkkx1nuk26QNaOi8tn46QqQKy4
         /6NK/2xXTXFtFHmoVL2nMzn6HrsvHyZIPM1Rk6FZzKS6jf5GDPWa2lI5eX0mccDqb2fN
         ysqisbih9YKJz0chg9tVeuEVf1KIDSSaYNxmzwv2CLI+1fH3bRrN8knmB5MqPEJwIDbU
         Yt0egC7G7SILlUSH1BGwh+Ip9NGYXge9QlA74NxmgW8lLnngUjlzQqKNNjXCre8WxDQF
         GvkqG56uE40In5pDUShZAabBMuhXLroUfjVFSHoKH/K4trJyhs1qeukqGuPtYLeQNoPA
         dFqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WAjkQmQffedcstioBR/bPz7WWF/kUAkcKil242Qiu6U=;
        fh=ebCtmSBKQ1VkxhyzIvyN2OLJjxWAJhdfqBG0ja86bbM=;
        b=GcwilmiD3TS4x4pTYuOPjPCH2AfhsmePyGPiQ7Us1GBIBKmhxukWuvNI4al/fk1mRi
         w/iAlBcWrCjVut08MTdZpXew42LQW/KDkvb9Rq95szc98+7typcYGyfXmL7YRS5zC3y+
         mzDhtUr3h4sO4T6ud8htnrXqAhnFNos+ZTDw/xFcbrMgYHIh9DmxT3vykjmAI3hazuq9
         nD0QUmsLs7MWVpQ1nPlcnzW5XPF+L34NXcTvgFOax3xkeJ5JS31X8RicLrDFVDVop5aC
         cJV0wVZSI5AbqO27/2wIbiCO++lWs2X3mGLIqHObvauRShZDTtE6Hmvph+Pcj9zCvs38
         oxgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789781158; x=1790385958; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WAjkQmQffedcstioBR/bPz7WWF/kUAkcKil242Qiu6U=;
        b=IFlcyJbKQZ1ErOnOi0LDEaqgvPiYJArojrTtIKp4QVqlRaXW45OnoOWbTiPaHtx1FT
         4IvSzcMkAxYHUhhvR6o3O/CKLNUXTN1waf8AU1UyidwjQT2yLv4ZsDdQQQML8qUJhTVc
         +sUb+5AMYmeaWLt05vdQKMVQs4/cDHRU+h4fUG0ijzIvaFXc33amookTzvGPWs2W6kpl
         5xyGKESlfKwhIK7D+v/DD+4Z00tjiR4yR94O2CW9tbWQ9T/yYPNNtmXYwvIlzhiYCoc6
         s29mix6pd2Rym4fXaXnyNC25wp2SQbhIO+P0mGtzWcF3YlrMfkoAonE9nf+T8krb6KXV
         STUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789781158; x=1790385958;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WAjkQmQffedcstioBR/bPz7WWF/kUAkcKil242Qiu6U=;
        b=sGl8cdOOp356TYEemtlCf248U0VOG4Gh+8O4PI6aNL7i2jtmESuv160Tjz7LilmwLZ
         djLrLC8CeNKRzprAHi3yNnvueNR1KKZiXoiS5orNhPc3z/OaH/D8pMiAdLXc/EFoqSQr
         OsULNM4GD43gjlBCDuDdTrwNwec4zBvok1STD80QZZanih5IJ1mpX2OVkmRmPaBbUtAx
         sswfL6MiEhXBZtb187LM3CE0aNRTEJ22fW8SMwAwZkuGytzOzoXSwFAXduOGzN1i0Jzc
         /uBDSouZuIiE/uKXdZAXEFinZ/zMdP702OrApM2YsdSP/4kTuzDnFAI8gdFh5bKqCb72
         CPcQ==
X-Forwarded-Encrypted: i=1; AKwUvBwouRdZ5oc6JhNBAZDymFk7Fzaap2cHNl4kJmwH0Ddw7sN1w+hcYNvE+0h/xihsi1HCpAEafHnndq7NwV8=@vger.kernel.org
X-Gm-Message-State: AFuF++nO7vXCV8r8OjbyBMbWGsICp2/XGfFXGoUGJX2rL1hIMXbOnhv2
	61zwSIW0KI38+A8OBqPTaSzd3KQiWXiQOhr+fj+PcYWyIAvtmm6mE5RvNcRQDx6tQhgAO7Mi7A+
	NeMHqeg8Z4wJBFONwjRJM19QseuqRUK8=
X-Gm-Gg: AYBFou399wDGOwezO6C7Q1qunWC9j+w58cOOkbC03R0h8P6hiRBkZ7L0APh7laQmsvU
	wtj0TM0RQsCyzYi8fCB9zvcyg761NexyAn22nLUa+imDt/wWv90o+FVmFHa6fHwVvUMSC4rPVri
	aMF/0eI37Dq5ysd4Wc45e7NYvho57tJNEwb4nztnDU1iC2JaDLM/csXf9Y/AyHGvAZlUkBvyAyr
	rg099NKKDrBM93CG5xiJojy71FqUafDZrBnHfknpkaUm0fO9e0lGQZZoIZpq+Muk8F7M4r1jsWi
	orGwe46qq4e5LL3RmYWqbXHwtce+OuRC1st7LGbAoQk9kvHK68FDgTyoX3cXmcSmbYgp0FabRnH
	3H941iD8FUNOVEVwkkbRF4om5C67u3+7jLg8tBhVyg6Qb
X-Received: by 2002:a05:651c:2213:b0:3a5:a4bd:bff6 with SMTP id
 38308e7fff4ca-3a5faeb291emr7755411fa.0.1789781157892; Fri, 18 Sep 2026
 18:25:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914014539.5015-1-sigefriedhyy@gmail.com> <20260916184748.52ae812d@kernel.org>
In-Reply-To: <20260916184748.52ae812d@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Sat, 19 Sep 2026 10:25:47 +0900
X-Gm-Features: AcwNN1VKSMsHXXhl9wsuuXYQn2cCHvXHrr3pGmCERUzA0N73AkVzctfHurZKado
Message-ID: <CA+7S2vKmeaPRBqu84FtVWUjo=U8jTm+LGO04BW6M9h2nRzkHkg@mail.gmail.com>
Subject: Re: [PATCH net-next v5 0/4] rtnetlink: dump link-layer multicast addresses
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Donald Hunter <donald.hunter@gmail.com>, 
	Eric Dumazet <edumazet@google.com>, Ido Schimmel <idosch@nvidia.com>, 
	Jacob Keller <jacob.e.keller@intel.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Nicolas Dichtel <nicolas.dichtel@6wind.com>, Nikolaos Gkarlis <nickgarlis@gmail.com>, 
	Paolo Abeni <pabeni@redhat.com>, Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>, 
	Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf.kernel@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 10:47=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> w=
rote:

> You compare the situation to IP but for L2 the UC addresses
> are not exposed via RTM_GETADDR. Are you going to add it?

I'm not sure exposing dev->uc via RTM_GETADDR is useful: I haven't
found a use case, and iproute2 does not dump it today either ("ip
addr" only shows IFLA_ADDRESS). If you think
it is worth having for consistency, I'm happy to do it as a follow-up.

> Is that the only justification? To avoid reading proc?
> Are you planning to extend this interface with new features?

For more background:  we have some hardware offload control logic in
userspace that
needs the L2 and L3 multicast state of devices. L3 already comes
over netlink; dev->mc is the last piece read from procfs, so we have to
maintain two copies of the code, one for netlink and one for procfs,
and parsing procfs has none of the benefits netlink gives (e.g. per
interface filtering).

The same split exists in iproute2, where "ip maddr" parses
/proc/net/dev_mcast for the link-layer entries. I already updated
iproute2 to get rid of the procfs parsing for IPv4/IPv6 multicast; L2
multicast is the final piece, and I have something working locally.
Once this patchset is merged, I plan to send the iproute2 patchset.

Thanks,

Yuyang

Received: from mail-lr2-f33.google.com (mail-lr2-f33.google.com [74.125.230.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F0547F3A3
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790935608; cv=pass; b=f8L1+BWJMxlUroNnJHYUQmsoPRwSyjm5ukMnw6SLB6ulNzLP2gZCwbB7UJBr9B98qy6ZtMjhe+b6yv7GDVQUCm6gcsP6vvglnRMO+6aUi+NRGBNtlarMg1sTNmV+N+2qHNZWgTzVAX1lCbHYJH4aQj7XPzmRU2NHpVnfQbR3Zko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790935608; c=relaxed/simple;
	bh=hEO0vwKwrqlXZ4TAvYBOxFpw+P9Ek/EqQqPC11dV1ZA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f7NoXyDmfv8ToD4xT0juWd6om1T7sH55KyvUOITnnXtIRo94qyT4jjQT/06bZpgzImivD1+H6q0zN2PKYVDStkyJTK7ng44PwwhkBEHa7agfJAz6r3q059tGR1DaypyNQZvlcobTWDSrgTtJkjZztzjDfrsoKbC+QdpPau9xoSo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kV/PN54K; arc=pass smtp.client-ip=74.125.230.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kV/PN54K"
Received: by mail-lr2-f33.google.com with SMTP id 38308e7fff4ca-3a87a4aa6f2so11989871fa.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 03:06:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790935605; cv=none;
        d=google.com; s=arc-20260327;
        b=lolpVIi1N8NHhhxi0JVNAFOAiiczwHld9l84RqmnEHbpks7y6qJZSxYE8zLHka6gsy
         OZMhu1Zwo/MWcLLKQIKIUVx+KkXbnEOBm0UcfhV2XvV7SRI8iz9uGGlX3MmOVZ+eBCTE
         Nu49UztC1UCtvB5Rbh+o2eSp3+7qKaL5xeKr+9i5xAsDKDlNk6IgRv2r4j7VhArqfqj+
         mASQoAs5v86U9blDr8CkmC6VVVv4hG01o2a5DICsxOB0czP+ZpAWAXF8yZwOMakgYcCn
         87DsxaFdkdjiD0YQ2QxNHQzH58a8y0gY042gSVqjiSYS1+H55OIj9b5R1iGmnlnfO7gv
         qBug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=56xOfDITZcNEcJrgSxRUY3B7nxPxHMei30QaJ72H4oQ=;
        fh=5i3cTRQnt/Ozrtyj0l4k7aS6NYXgwtv3C+iTwTNR6dc=;
        b=bXZMyjB5gAp+MxUKk8zIg1V6YBK3RDotzdprz+bGR/wAKu8bAYIWjjW0sMYVsSHWM+
         FNhQjrnPPJ439AyKDpsc6tPRFI1PSLqFbaMwnJD3aV6nbZMhIwjMFWHUJud7M6/Z8ji1
         mNrAsScU4J+oDEpvIXy1vmVInHTO3pwep8ecJFHIexYyFUdFzG6915eeWU4CRPXuScqM
         pO7N1tnrVXk26Lg++GUQ9jHirQMLRNkAQPS9SwrnwLoc7HMVmPcWmlOX+gHT6s4zEUEx
         CkxBFGuaR9v4tc/fwPdEqJnvQGfrdpE+dmMIJg0HqeyClEapHMjPYxiqjka0OpOB0KII
         e9kA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790935605; x=1791540405; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=56xOfDITZcNEcJrgSxRUY3B7nxPxHMei30QaJ72H4oQ=;
        b=kV/PN54Kt/CFgtZWInPcN0fNRdr+/B5yZCGiB43z6g9Dpi+TG6/aCQCtph85JBw2d0
         BUoehj10Rpq6MXZ23tvdT6SucBtASmv7dx1IptvNnvXaVx6MZuaUVYul7L3xjKbuiSEv
         WSJFu30GVBculKOIHI1lSX8BUd+H34ET0bjxiaV1vl7hMv5ZbrDIL3yWl8iW3nINyeRW
         QLOP1ZRudK6pnft41ccPtQi7aAJQUUmP7Uwbvmlz+sP9gVEmOr3ANNdrC+ikZvwcMnWL
         +SMDj5BNxLo8cH/Ca1oMCXAxorlE91Epnl+Mkz3BUpd67npHl2kCrQH7N0bbNeiQ5wZT
         zwoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790935605; x=1791540405;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=56xOfDITZcNEcJrgSxRUY3B7nxPxHMei30QaJ72H4oQ=;
        b=1tazr2VrfuZGwJDLnmoLsjA3s+LtJJEPZu14lT9BroHPxhaMuO+sZYOhauSjBQsQSM
         60wa2yNz4Mn0i/TSrE5F/ZDy3Jd1beunlWikTKyd17Zdch4XAVgQ8F/gjS2be7DfhvAA
         oVNq7qJJ7J7veUaSDz6n/IsGbz/PwHVQc6sWk5oD8eQvU12BbSDi4V//chJnW1zWlYo6
         O/lV1bUsxHPuPLDP1Sj1PKbYSQWF9xGC+VwKcRnIGPYfSHO+eWjqzosUSUFlu5mzcNLj
         A0a4N4lSLcMSYEzA4GPw+MhYpxybaMQvT5eZZY0/Ki+V+lzRLgs85s/DKi2pclq5xX61
         uOjg==
X-Forwarded-Encrypted: i=1; AKwUvBySxItmo6KVgs6uTDZeT7oiUba6oe3SA7FMhDmTcI44ms0PD/8Pq4GuWqVB9ABJOI0v6Q9XGjWwI7C+IfY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqbFH4BCbgGah46BVrl1o0oWllMfN9op4h7nwWiFx2iYVG1S6c
	7hDOVigK9LH4qbrekBkSeQ6fOGBwwjXjYtby1scJtBCMLc5cNeyRHpgw+YgPGafLN0TsA18a1aC
	oF1JxZEkiKuMApTWhHc1zZ81tFCOVgdo=
X-Gm-Gg: AYBFou2O9EaxYoLTlJU7vjN9kxixUphxin4CANUWy42eHae15BwyFN/0MKwrHuUSV6o
	YoQH8URRTcfZQoFQ+U3mWdNr0/JFKMYROjGjzzRtk7BZ28IeQj8Bv8HJHbU9XighLeBKZXb7YRY
	i4/eMJEfheygP60pMv2TkQqLsk/i+4tHAo3bsaNVY24+iAk6O7DDvR+w6z71RTqrNrVHgNL444B
	4s1OWv0rx6mV0y6m4/MNnYIXKmG0HYmzvEd4SVmEtBcJ0937TUiiYu6Iy6NCSsB4rJTy2gWe2b3
	3K9PHi0gjFTBajH5W3NAP8ih3/W0b4ZXBLDEByj9BFdiPD+Bo/svFIfscYkacI6YZ9/Q5Uah1cg
	XJMeX0L5Tnqb1uQgfM0Jjdg==
X-Received: by 2002:a05:651c:31ce:b0:3a6:4e4d:9d1d with SMTP id
 38308e7fff4ca-3a87ec366b4mr5542271fa.0.1790935604459; Fri, 02 Oct 2026
 03:06:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930112842.21323-3-sigefriedhyy@gmail.com> <179089747937.434549.16341143363097629528@kernel.org>
In-Reply-To: <179089747937.434549.16341143363097629528@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Fri, 2 Oct 2026 19:06:34 +0900
X-Gm-Features: AclHuK8Nz_2jnmVTxCDn7TReanMq4quK1jlp8YMQzgl3WrXJWrYulmhcHHN9ymU
Message-ID: <CA+7S2vKBrjAMW5h_Dkpuy+TYum7m2=8GL1etaDx369ZSMRhHRA@mail.gmail.com>
Subject: Re: [PATCH net-next v9 2/6] net: change netdev_hw_addr_list count
 through helpers
To: netdev-bot+sashiko@kernel.org
Cc: ajay.kathat@microchip.com, aleksandr.loktionov@intel.com, 
	andrew+netdev@lunn.ch, claudiu.beznea@tuxon.dev, davem@davemloft.net, 
	dsahern@kernel.org, donald.hunter@gmail.com, edumazet@google.com, 
	idosch@nvidia.com, jacob.e.keller@intel.com, kuba@kernel.org, 
	johannes@sipsolutions.net, kees@kernel.org, kory.maincent@bootlin.com, 
	kuniyu@google.com, nicolas.dichtel@6wind.com, nickgarlis@gmail.com, 
	pabeni@redhat.com, sd@queasysnail.net, shuah@kernel.org, horms@kernel.org, 
	sdf.kernel@gmail.com, vadim.fedorenko@linux.dev, willemb@google.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> - [Low] In the commit "net: change netdev_hw_addr_list count through
>   helpers", a new comment on struct netdev_hw_addr_list::_count in=E2=80=
=A6

Agreed, but they are nit, will fold them into v10 if another version is nee=
ded.

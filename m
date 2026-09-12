Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C203933936C
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 01:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789176845; cv=pass; b=o9D5NMX6JPvIV/0xFhMorXtDiW2zrO8I0pe1TtqRf7WGKEy3um7At2exEgYPnkpoBPEOabN7tCCRfDQroB1+xwakcZcR80PJHOf6YCeWKQjsLXorvzEeQRVZmwhsTp7b3I8xWa0rISaWYBRicPVrIigMhdqZjVpYOhyvaqubdmA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789176845; c=relaxed/simple;
	bh=IGOSxZy52FtrcK0G/EPYqVmio1WKO2seotaY7iqwZao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sw71N+CM7ouTrKMR4LWWtGnsI6JyZz/NOwsZ42Ohp6a1kgxQSlgQVCUhaQbdw2C5G4dGW9VxPgwQeUewPfj5yyEJRbMsKHCAn/1tg61o+xoPN2iCJ+YPgJ2OjmH9MZUmYX1I94GhsbMJMmJV44CrhmdhHhH5xTI/6kY+5h1+Ii0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aHYyMx9Y; arc=pass smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aHYyMx9Y"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a5a04b88e9so1322611fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 18:34:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789176842; cv=none;
        d=google.com; s=arc-20260327;
        b=Bulh1S4fttcd0/7nZgf7aqVgd+AoEHdkqaoX8/h0uf77SBhZGbf5U/ow3nDMOXLZNM
         ejcJVH6IJ13BIL/vx1R8z7IIWImwC0m+HvFiHjMQ1DXZjqYWGEwz9Z891dlJcq6xx8Ew
         QAj9D15YLqgPI7IAC1aE64/Gd4TaxllzBGB1y0Sbb/VHiN45we/A9EGPLk4vc+d6eSfo
         EorLeoG3Wx6eH+ve8xdWYgsgodhhJCQq+dSt6QRuvTvBjBbiZLkGzj/KUig3HvE4Dr/r
         H8ikMjknq9ybpbEB36/1JDm4N/YjFZf31RGgjkaieDBiXbWzmFwlnmKnQCz83jTtxzwW
         qZKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HoTJlBemOW4I0RfwGhPeZYrkBgu1h2TKr9000ZstYMI=;
        fh=vCqpUCkI4YO2EN93jyjhmN0E/a+Frf/MyCDxu/Ldayw=;
        b=b+1BwIqQ/UacaDjqvRqYRHIWixW2UisM4HltKeWespqhgN1Mv4aj5nPw3piOEdrdpl
         6ypoQa0m6/nt3fDs8m8B2QuyswX8cRxap8YqPbks15IYkE/+995LcoBghecGJ7WClVEM
         /kfDHcjcMUVmj8mpwVPKNx8vAPMMYFBXZuk+HgijuuEoF6pZnIALUkTjp/gVZ4RfvYbX
         /r1/M4J3o8eDGkztARTLv0zpnkYIj4xIqfEKCciATAMDxEHn53DPiOIlMrP9pdcsECM/
         l4MOzyrR31kB3+fYK5iMeDyn0e/5RhyiFTHd0QdZ17g5b9Ov0fWy1DkZsfJXZqFyDCQS
         6OPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789176842; x=1789781642; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HoTJlBemOW4I0RfwGhPeZYrkBgu1h2TKr9000ZstYMI=;
        b=aHYyMx9Y7dTKBSp0hmBT5xBOGgyJF01I2r0YQ8K/fpKy2eI/AD96POYpnrOtr76OKu
         3orGvxbkFnlGJYmqs8h4OBInlh0mMbGotUh69pEQ1b/S69hq4qxUJInVCvNqhLGp6Lg3
         KuK9rQ8UXIq7StA4bjQ+yAUp4DvQYbmIcGBnIrl27q3DZI6TT4geN7IITOSZm5bd01eT
         ksALSO8LLMyXiu+wNSjp6kqgmH6JRA1kCvht5rcgaq30zh7RSY7rZOlSw5/nOHj6DeU+
         29k2Mw65/rVbLV+emEQpfBgMctSBXCBMfRnDFjZSbSVBax8hSi0XTlJiKwfsuNHEYLl4
         S6qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789176842; x=1789781642;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HoTJlBemOW4I0RfwGhPeZYrkBgu1h2TKr9000ZstYMI=;
        b=OQSEpr5ycXvUEfD3MBNh4FGlA1q3zsDo2dak/+Kjt95qhrYzQT6bZ5SRHQmJ7CaHuC
         oMAquJYteZ0QEkcpQRa3lkS7gh061NBVhY1h7XVQrtmFab1W57vHcjkuj4/2SxVyNmY6
         1TDeere1AqwTmw2ncICqUnk3nLE1R/g9XLAjtMX8F+U+3e0vySE6LAONCwgMUlXojX2Z
         wyJKMC7HRwzSjF0dqYM634YvXYyjUKUbv+MoOgid0qMSZ7kNnEjhutObgQ61zy2/V4cH
         3DW3ZasjZhV9dzkDGYWc0ZBHQuO4z7MW+7NgLmq5uivRnwnVFv0nm/PlcSAktsaj1Gxt
         kLhQ==
X-Forwarded-Encrypted: i=1; AKwUvByQngx+Xu5/0TXFUdUOcquMzDqxXWdlI3tL/O/WdliwD23UrW6PM9+TNjTSv/Q1STU93oblEs+0G/vvz4Q=@vger.kernel.org
X-Gm-Message-State: AFuF++nSaeSy/mIyo3me8K3uC/wisH26ubxME67GHRFfAuJF8iR4nFZ3
	Ya7nye88w9o1R5RZeQZkQdEu3lkGOaFlluWslR/j6pB35miTIH3Zkke8reo2GYbBAP1Tv7AqoDk
	7IiJLlHA5uIxdJig8/SbGRGfiOHxBymo=
X-Gm-Gg: AYBFou1EZ9f0EPIIuD+rgdm9Tuq9TkSttJ8djkza9o9FFNaed2Ywjsetgd2akZFHME6
	vL4URdb3s3fJEjOsGghcmKViscKe/kSb08LhwmsgESVFXuz2CsKqHd7aAv3UGpoqhI7+7ihfsi/
	u+pv4TnNGlvNVypeJkvwsc9zwIhLiBfVujlKQsikoO7qarTQR6tcYHXEOIxz5eT4czD3x2uatfw
	Apr6nUe/KXDb6YCSP6TwIFfOcUQHcIMaW0XeWygy/YzmCQt1zqZiTUNt6+vXPRfoLFVc1DkxIsH
	raYWapEF6cYcK4Wew5TmfgbxkdJEsdcrdKzl6Z2rL/StfGfGUSpnKRkF9fKqEtBvZUJjONvey+Q
	QBC1ZWssxFqXS1+T77nOHrC9eOEAG6YI4Fr+mvzZtllXM
X-Received: by 2002:a2e:b8c8:0:b0:3a3:749e:319b with SMTP id
 38308e7fff4ca-3a5b37efbc5mr1133491fa.15.1789176841298; Fri, 11 Sep 2026
 18:34:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911105103.7771-1-sigefriedhyy@gmail.com> <20260911085056.10dbc3e0@kernel.org>
In-Reply-To: <20260911085056.10dbc3e0@kernel.org>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Sat, 12 Sep 2026 10:33:49 +0900
X-Gm-Features: AcwNN1Xwmy2KElPk9P2Qv9ivD-eVQUT7KVSPXOdAv2xLdRuqCz4GQnL9yyMnlGw
Message-ID: <CA+7S2vLOR7aRY42-4j1v7C27pPSaUt3h00FjrGKVOUC_2oVFTw@mail.gmail.com>
Subject: Re: [PATCH net-next v4 0/4] rtnetlink: dump link-layer multicast addresses
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

On Sat, Sep 12, 2026 at 12:50=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> w=
rote:
>
> On Fri, 11 Sep 2026 19:50:59 +0900 Yuyang Huang wrote:
> > Subject: [PATCH net-next v4 0/4] rtnetlink: dump link-layer multicast a=
ddresses
>
> The new test seems to be failing:
>
> # 0.14 [+0.05] # Check| At /srv/vmksft/testing/wt-1/tools/testing/selftes=
ts/net/./rtnetlink.py, line 171, in dump_mcaddr_l2_check:
> # 0.15 [+0.01] # Check|     ksft_eq({(addr['ifa-index'], addr['target-net=
nsid'])
> # 0.15 [+0.00] # Check failed {(9, 5), (8, 5), (11, 5)} !=3D {(11, 5)} ta=
rget-netnsid did not dump the peer netns
> # 0.17 [+0.01] not ok 3 rtnetlink.dump_mcaddr_l2_check
>
> Please wait a couple of days with the repost.

It looks like the test is flaky, I think I got a fix working locally,
will wait a couple of days and then repost again.

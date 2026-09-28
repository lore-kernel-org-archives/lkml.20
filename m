Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085CB31E83B
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 04:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790569753; cv=pass; b=PRNM15tMdum475Xgy+bnaWryOBn8DS6+sqhTMymKqY+3Ici1vdIPKRzUbaVvggukJ6ytyng4V2QpciFDwv8ECbNpuovs5pxeEiPbEaCy00KRdYZzXYmdhIyANvd2ilymC2OedkzdzdKFzIBjJuqgzfiolweINvE2+hMYegCI3uw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790569753; c=relaxed/simple;
	bh=Cc3Rs/HFoYxnQJtyAWsDpps4zoIxWHTErRApJAjwabU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kzf3NG9Llq0UDSCtCHzBhvQs9ou0dJbrH+l67mmsuLd6DwdM2g6Zz+e9dguFjB1OsZwFOHxMoaVTt3Bh6Uiy5odhG261eFokTeypFBF9sPzE6Ot6PU/kjWk34n1nHthxGPXmEdOhKpsIvq1ic2eRmW3YQj9FrTarVc8BYmDTJFI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pXeAuRn+; arc=pass smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pXeAuRn+"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a5d8fe88f7so377522a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 21:29:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790569750; cv=none;
        d=google.com; s=arc-20260327;
        b=glaxtNP08IBpijfJOU4K0m8uTDo938dq+Powz99Qs8fKiR3m6xF8pBfchFmedJE4Lj
         qluWHQwxRIYBN5U7FhpW/dGxQA5jqtmcx2F+mOneWliTBD079mYVNDYYrdIET7YCf3P6
         gck3yCZsGAiuRH/PJP9w1sl6QyYkxe0VMFqRjy5FHHjrQqgwZXDc7lJD5fmWe3VttT3b
         UZDfcmDjqAGHEtA+lPlAtwkyeqTXrABqDyFeHw3z+aoxbqwqcnx/RHNgIMTPblLgh4dH
         qMDhQdSeIiFykdsoB4yu4FMzx3htD/SblVS9wR6BEEAh+4yZnIIjXMOmzPgj/kI4Nxyx
         DeSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Cc3Rs/HFoYxnQJtyAWsDpps4zoIxWHTErRApJAjwabU=;
        fh=/3evh/04s9r4bM2IskBGBbase6+xqj1zRX9SWa6yvUc=;
        b=hYJXOaP0DF3doMds7No8Kt2IiKqDpblE1kWJw3LZ80OBtgBYmya7+3V/6p3N3Wcr/2
         pKK1mJhobes4V30nWhLr8/oPL7sqAfXqhG7Ll/rTGh47/C0TyeAIOfrGwwP9b/cGQvim
         3rvPxumiGw3cpiauN50JwRyI7FvgwAvCThbS9QFY1yMNvJ1MzeZF9EPqVKbN/2XjO+tz
         Rf2rdPl0sXwxgstn+cPfIc0MuF2pzR3Um11lKyDyrQ24e5YQcDJTOf47sBZATBTuLEgv
         YJjD6X/T8j03w4ICLTRK+c79OVTmz2v+/Xrz/jEHASVIB0wGmRdZme7HFarGkKuGsdc9
         oFvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790569750; x=1791174550; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Cc3Rs/HFoYxnQJtyAWsDpps4zoIxWHTErRApJAjwabU=;
        b=pXeAuRn+ddF0PVsymMqgNegnGtg1b4NAlpiPCuZWb0JVmQveDaksMta1+Q44/vX4z4
         NS6HMRtM9oO6PxIr8aU9hrqqfEjpWfV7r7A/mhhvnVHkCS8JUDnz0f1SeHubW+k25th9
         AEQ3+TRnwDhEyqsP85VLQ4MBCQjhGEQ1yvJHBrW02p0Du9YvKmZ3E/r35tAt7PLs1WVB
         oUh5C+nDcI9y3PJiAZ5w0nOZBskz+4ncjzLN9h0VgKCsc32OHgy2mVK5++GsjJME4WRa
         HbdStvGQvFu617YocpzNNzgoiqiBHOWWwYX2sxaiyY1Hn0plWJPNamCVavi4dhMMmU0r
         Efig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790569750; x=1791174550;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cc3Rs/HFoYxnQJtyAWsDpps4zoIxWHTErRApJAjwabU=;
        b=a+BdlGlO9Pa5i5i983McGh6PXuenb+kCagrh95cKmjDzEOxuBHcIADZG9Ul6wjiLJQ
         8DycQwQiHn+L0hhzSGpwDWoLXT3eJpmMJh2lBfNGeRhqDaj+xpAUn2FAuQ9nVsiYRsDT
         HzgeDmmpGIzsFNEVf1+rDMGbsydD+qe4ALRUEgYKNUmibBaJUhgRgAKjgKDzuRBifczl
         x/yw6ilkVySfE89sy+Jif3xxUM1eincog5i3SvXaM4+B9vxKXZKv/n6JqNv91IhqwShi
         yocEYuTWjzD6//+2WhePv7TfEfrd7lNGn4ZNC5vvIh9Hbl7Bt6nNVjzr2D6Qblm4jp2B
         61jQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4u/ihT3k4HEVj18CE/c7344/aZlhEiHvM2ZMk9ixYem7Tkd3o5KewkF/nynRnpo4XaEbxR+slPkWd11Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYL1h2N42WzVO54Oi3u+1IUnVdDWty+KK6BASO4GN3V+p+fKPFvZ
	aqZdbs8xq9ePoJ4HT5e+f/IRy0mi28U+csTLYBMcEE1Vv/pdsa2UHV89qDiiZZHGKKAfxcrgq+s
	2CxDveHL2380+rSB2Xdyoiu1rI6eAiBQ=
X-Gm-Gg: AYBFou2qpXtVXzyYJn8pfcEu1XOXYxiCl83P4tWsaa7brihYgj+bYAT7WCM1Ziy3Kg2
	5DINPfojQscpy49I1267dOrt6qRTzRFsrZpF9lSqoy7I2pruDVInuL+FhaFLH+TDE75vNWiWh5n
	GvFvOzRjsIXcUzlybbQroDQv8STGNgrCczpb5nRnDE6h/ktNYffXCUJhCnHoQFSBjyigCqI6jQQ
	JH6FOJ11Kn7orzJxYqQXSGov2DmgIkclPx47ZIKYXTB92VcesuT9QUu8vv1M+5Y7Gwc1qkPP/q0
	5pNPmpk7hX8oSiMvmTcq9sSI4XWOHlKIxnQ/VdTCbcqxc1ijw9UeF4cm6RjfppQr0rw4snS/zBQ
	UKNwmYsWl2Fc=
X-Received: by 2002:a05:6402:400b:b0:6aa:91c2:63b0 with SMTP id
 4fb4d7f45d1cf-6aae1fb697dmr8030974a12.2.1790569750079; Sun, 27 Sep 2026
 21:29:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927071520.3693598-1-nicoyip.dev@gmail.com> <20260927150704.62c8c919@kernel.org>
In-Reply-To: <20260927150704.62c8c919@kernel.org>
From: Chengfeng Ye <nicoyip.dev@gmail.com>
Date: Mon, 28 Sep 2026 12:28:57 +0800
X-Gm-Features: AclHuK-9Q4O620Fsh2sXCA3XvsN6P-GhXbVBeaaDb7-HyX3to4btQrRt88NoqIw
Message-ID: <CAAo+4rV+99b1ZaiA6EnNBAivfbpOtq21wSMJNC9OeQ2wLbHqXA@mail.gmail.com>
Subject: Re: [PATCH net] netfilter: nf_tables: serialize offload stats with
 callback unbind
To: Jakub Kicinski <kuba@kernel.org>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, netfilter-devel@vger.kernel.org, 
	coreteam@netfilter.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 6:07=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Sun, 27 Sep 2026 15:15:20 +0800 Chengfeng Ye wrote:
> > Rule GET and dump requests collect hardware statistics under RCU withou=
t
> > holding commit_mutex. Callback unbind removes entries from the base
> > chain's flow_block.cb_list and frees them immediately while holding
> > commit_mutex, so RCU does not protect the statistics iterator.
>
> Slow down. Please do not submit more than 8 patches for networking
> at a time. You can revise the already submitted patches but since you
> violated community guidelines we ask you not to submit any new fixes
> for a month.
> --
> pv-ban: 1mo

Hi Jakub,

Understood, and I apologize for overwhelming the review queue. I had
accumulated these fixes over time and submitted too many of them at
once. Sorry for not carefully reading the submission guideline.

I will not send new patches to the net or net-next and wait for these
already sent patches to be consumed.

Best regards,
Chengfeng

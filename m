Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FB435DA4C
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 21:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791496092; cv=pass; b=UqD0RHq7q+9ABJQG0F8WojGMhB5InS5mhSvE9F/Qcz79FCtOewlch073RMV8nNgW43+F87psL+1qXbU0yt5CeyNsBhCShbbpOCvGCECOPVCdZKomc+AvQZpM03P6OZiJu9EnnK8gKLVkMri0uwdtpCAiCCCH0OkGAV3hVF0xtK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791496092; c=relaxed/simple;
	bh=d/cxQi5bl2KO3QA7Ge7jeOTx9NRmHL08KKAX7/aHZBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T3L8YnbEqvfPha7S0cyVW/9om0Xj6kd5l9b5r6AOwVNWfE7qY6qTngpMuJewE1+3/uSE3PTMTO1WvOoa+w5p5nD0jP9AB37NB09Br1YcSjRCNmaBOINIPX9N6yZHQ74j15pQmnopvbVHsmi9roy40Ngis2ToA8sSPH8VFxvpHiA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i4XOrfKH; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i4XOrfKH"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5337fa12431so60611cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 14:48:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791496090; cv=none;
        d=google.com; s=arc-20260327;
        b=SFEw3uQ1IEAyhCbbRNP77YCvgFCtAtzc91jZzG6QtVSuhVa+klh50DHWOP27yzCNkX
         hppHH4k8coM/xb9byGgAPTsBiv5WYPjJwzdOHStKzcxozJtNxTkIkxzZZk3X27iBTu+z
         jr7vzYS+K5RzbGlQyrSVwtbmbK02Nm1GQkiHfHDxgUHfxd1soqVYRXyCNebDUg+xRzZE
         RJDizOWPqwz+qmYw/drXcm4ks+0VfVCBKFPHf0O9w69niwgB7l3+IhcRbbr0s3BpVoO+
         zGIPkQGLs26fgfd23elakFueB9j78t9Hi8bz/MyUK8/Ad5m0a0cUpNvIiSBOnpjcVsEX
         6Lrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d/cxQi5bl2KO3QA7Ge7jeOTx9NRmHL08KKAX7/aHZBM=;
        fh=pxOSkOSljfFi8PXNZMQYRPHKQkcF+vrP2qsyF9LCACs=;
        b=MHtO+BtwlcklOZS0afPpfmGY5ZJm1WT92bmQtKYOochvdfkGQQeJUlZ0dDTtaZPeHO
         NsdZNq33STjD8FPJ2oC/z1DUiYeLhLiHgdtQMNr3Y7tYq8KL1W6qBmuGJeB5PH/I4Ppb
         1xxI6ubGJ7XIPIicwYzDxWsVXxmss7fT9kne9pxWWWt8iMt3VlO7kTf3bdRJgydyOjz4
         zPm7ScpOnUim3+qMqOkiqsuabYafk8DALEVVdM8kaQP32RoSMJcdt93dv3TJz7O9obOH
         qsCmCT897ohPq933cjCTtMsf0AdxAZ+KESn9JBdD2bAe2hS+yhryTGV0jimkuJDCbeX6
         yp0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791496090; x=1792100890; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d/cxQi5bl2KO3QA7Ge7jeOTx9NRmHL08KKAX7/aHZBM=;
        b=i4XOrfKH4Z7wonh8hJEW2LlWuFXiwMClZcHlU+QZ+Ln/cvdTrcyrUybMAY43wcUmJF
         W0hxPjxHnNSlpqLJTyjIBNJnd2eDSgbVmJxgxfZ1LQakFV6wx84N7GHh3dkXEW4bSfgp
         4x4aaWZQHvZg95WZsyWNIs3jo4gk87htFQYARWHzT4GagqbaU0mT+Boct6mCoQjxpO2O
         nZZAZPLg7fcUoCk1JatmzCekIszCYakd6a9wA+zJNNOIy/NpSt0PFAawsXOrmlTMfZvC
         Lgs+JPzpvKhUvjnGTqiLFR7h/N33LazRvRK8vAinLdNh6Is/IQc6ncHfIhfr8aSxVXlZ
         aJAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791496090; x=1792100890;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d/cxQi5bl2KO3QA7Ge7jeOTx9NRmHL08KKAX7/aHZBM=;
        b=iPyzaXgC1nyqvTTBkjTovqhVtjXdcv1h2IdCv+PLiu6frFpc+1fzUftL1gyxH4m5Z3
         MlDvvz15AYbvbwwQrfbpN8GaUhugGiL5SPSid8GcHJJ/sbVZgMITt7ndjIl2b3/5FjxZ
         F7B9UWIq7nJyCYBGsex8okbMzmsT81g6wRxBgMi360r11FnOFiwLeAuWp0mNLlIUR8RU
         NkDVnvFTi352bDyokiCQOE8D14KE6+je2MJmaxNsba7RBgOZbmocrqa8q531q0GzFutN
         QkTpVUKsKNBMe18TEvlFlUDPulm8L3L0bzB9uJuYU8DRIwmg8QL5/RhuHTlOQ1Ujkf1f
         65NQ==
X-Forwarded-Encrypted: i=1; AKwUvByHRxJF7+cnJSQXWS823HBrm2LBy/LpgxrZfW0hy13RGdLLzZtRtx+nh8lo3fuanXov6/gO2dhRopKsnW4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3tt9hSfKJYM+kor21Y5jPS7fb3TrbF2VNrwdTKWGnWori02vi
	EtLPq80nQc2+nHIO+dfr6+v4NAFavX//Zjps4Z9xdqZGUZDy7SG+NKjjLWAUme92SXXIHYV0GeK
	8xvKX1U4+9Vx3tlKNe4BURHp8HqEK/THuds61g21z
X-Gm-Gg: AYBFou2TTVBO/LMknK3F1mvha0ELOcov4G4z+6//Le6y6X3XfelBPJjaUMihWbpPwJl
	RJBvphNGhKSDZOxsFfL7GvHr2ylDlGtCszWLyEchpXsG62R3B9ZWyWp8jmjXUg2PHALg6psJzXC
	z+NImMzOly830GYZht2XWb2dS2SZ64tgAymHd1lv9RAZAeJfNcMosRQV10CDpzb1qOj66j2yV9i
	Mxfpufzyo/eEfoOicWyG4gPZyxUm4PuqHG4AXxu0R0bcC/TUplwgW5q/2Yum1ylOdk1UbQDhFRh
	0SqIEh6QWJM3WYb+KKc7048eWRQlhmDgG/EBkwbB5Jb81cjKuWIVLWRs3zal91EAGyXAGhvehS9
	ljb4V7Kkf6bKM3fCexjIWr6/0gdUVn2KFlJklrDQQK9o1
X-Received: by 2002:a05:622a:5793:b0:532:9220:a9ae with SMTP id
 d75a77b69052e-5359e455c40mr1433461cf.6.1791496089446; Thu, 08 Oct 2026
 14:48:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAL4WiipKWgA-EcFWDQd3t7nBwU7AnkLvqs6j--he-dR-SAgqiw@mail.gmail.com>
 <20261006141300.1722466-1-ncardwell.sw@gmail.com> <20261008212007.11619-1-nramaswamy@openai.com>
In-Reply-To: <20261008212007.11619-1-nramaswamy@openai.com>
From: Neal Cardwell <ncardwell@google.com>
Date: Thu, 8 Oct 2026 17:47:52 -0400
X-Gm-Features: AclHuK9JwqNAnKKUmQkb5nbkkVlAY3vgd5ysmdQybG9TDCTGPUW7dr1Q1zAJXag
Message-ID: <CADVnQy=X6-=dBQ5xjt5r5cEnjvEWjYPxg+vn3nH481r4kFc96g@mail.gmail.com>
Subject: Re: [PATCH net v2 1/2] tcp: restore RACK list membership when undoing loss
To: nramaswamy@openai.com
Cc: Neal Cardwell <ncardwell.sw@gmail.com>, edumazet@kernel.org, davem@davemloft.net, 
	horms@kernel.org, jiayuan.chen@linux.dev, kuba@kernel.org, kuniyu@google.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, shuah@kernel.org, 
	ycheng@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 5:20=E2=80=AFPM <nramaswamy@openai.com> wrote:
>
> From: Neil Ramaswamy <nramaswamy@openai.com>
>
> Hi Neal and Eric,
>
> Thanks for the detailed replies. Neal's approach is much cheaper than my
> original patch on a few UML microbenchmarks that I ran.
>
> I'm not entirely sure I understand Eric's usage of "often" when he mentio=
ned
> the O(1) list splice, but the metrics that I've collected from my particu=
lar
> repro seem to suggest that Neal and Yuchung's assumption about LOST but n=
ot
> EVER_RETRANS segments holds in the cases I captured, so I'd be happy with=
 that
> approach.

Great! Thanks for checking those.

> (One super nit on the runtime complexity of it: in the comment for
> tcp_tsorted_relink_skb we say that it's O(1) amortized time, but I think =
it's
> more that during partial undo all relink calls together traverse the RACK=
 list
> at most once.)

Sure, OK. :-)

> For Neal's fix, I also did write up a small packetdrill that shows that s=
egments
> that are already retransmitted and then marked LOST are not added back to=
 the
> RACK list during partial undo, as intended. Happy to contribute that if u=
seful
> for explicitly documenting that this is behavior we are okay with.

Sounds great. Please include that new test as another follow-on patch.
I agree that test would be useful to document this behavior and ensure
the expected things happen (and no bad things happen) in that case.

> How would you like to move forward here? Do you want me to fold this into=
 a v3
> patch with attribution tags or do you want to send a new patch yourself?

Please feel free to send out a v3 patch with attribution tags.

Thanks!
neal

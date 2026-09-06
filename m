Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA553C199C
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 04:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788667886; cv=pass; b=qkRk6f5Lj+7cguc3RucJmM6mwpAphTcgV2KDhnfXIlkdBYRrdTsfbY82tUOxaVKa88X0sAzyri360s7PoZ6FnnEd0lu0D4knRrE413R0J9Q8S2boAavLRi8X/wLDRCXtm/yp36neZWGYtwL2lbVULPKUbZoOZ0mQ2j7wbQfpXsk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788667886; c=relaxed/simple;
	bh=o8RRhMmOJZ4Q8Ws8xLNr8N1jORKBteyJlETpeYJ1kRY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K+DMiMD5jbT5KfEBFhEMOc6iJdgoS0K/v1R8Dnsk3JQl7Koo9bDOq0i/Ys0WCfAsYuraCLe5SwUV5EgWzXj+QSPSwghnQEbMBCe9W/Wyh3byNl22L2AqzKdVgF4EpYkDCYbEKX/sfd0GO8YD8HuGCmIAZrGOpFLwPkv13ZCaCRQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=gsWl0xQl; arc=pass smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="gsWl0xQl"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39c86ce9e29so17612441fa.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 21:11:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788667882; cv=none;
        d=google.com; s=arc-20260327;
        b=gff+rthZfm2cov5/i0U7uPSARONbkNhz/+EpOKULntuC4smiE6emk7yBoiUr5piST7
         JFh78ffj55pu4fufqLz04M20kSEBSk7xUbsSXQdQyzDIcGEcWgTxu2TcHUJfWConOI5l
         LVu84avDOy2psezTGdgqnY/9mB0UUJIvUjREy6BPQyeDaVvbfdYB+14Rh2ZkNsuNlDby
         LON4Aj8ysQVZbmMpS+UVcJp+vnUXAGZcGoJm3GZb6qsan2iYKRuzkJGx0/c+lwknSFIc
         JCAM1ARMIsNWgAY003BlL22gxDR4a5fQeNvGehucmIVk6ZJckgWIUiMS1limzwFzodBL
         UdnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A8ob/HIduIdO4mxeAjoBbDAMkNrzJkir8KFEywokfoU=;
        fh=8dNGOwxppf2BgLCVHjlZr4+Lb9Gm0XVIgAltBXb+4no=;
        b=n6qAkMYfCi7T2ZZlGblxhHitlcHlFSiFQqw/hI8jkhyLHc51e8EFHPCvIKmT5efkL9
         MnYnM10EASoa+aSndX7H4J8oSSdABZG90e0Q6G7rtlGS5tPCAOGrIM08xmWEXhbaBHoo
         zC0hESz97fch4JgBNRi/BZWPPAejywqEri4nAKFlmqjF/hsZODjww6CM9IYaXZJbcipq
         7Ll67xGyCY0EXDT42B1hFqfphb2i/DD2sYEC8fp0agY9R1Zh6av1w50kC4JnncIuzHZ8
         zUYeH3gahzmMw+Tqbnh3Tzse616wHz+KV/M51AiS3e8BIcqvrtE2cCamBilpJ1QVyxxn
         1rLw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1788667882; x=1789272682; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A8ob/HIduIdO4mxeAjoBbDAMkNrzJkir8KFEywokfoU=;
        b=gsWl0xQlYcx8XUNBl1rvfDlda8jv6dU2v/34V0RWMl0w8WWAUN99iynCISfQA1Wpa6
         eXuyk38fDHSd424wVQK1Ak4PlfEdkwmD5mCfD/B7Jbfbbs5RZG0DqCG5nmRR9+anc+wr
         C8e8+l1rf7mW4LAAI0rI/0oskDPGpZC0wjEBctRuich12FzON7mxCHVSEVPV4o26IrdC
         KEBCnB7CS3pPPmZudziSGxh9CUrXOHWHp5Pe+SqV4mrgmMm5//cmK8pyP6PMWPBb52eO
         SIr8vS0KTGh8rWiKzpumBYDXKC1ABbs2oKDXTAeO4pZfQqgz9BeTPDK0d5GBaggfpzUA
         iOeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788667882; x=1789272682;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A8ob/HIduIdO4mxeAjoBbDAMkNrzJkir8KFEywokfoU=;
        b=nsECwjVqryBL+it5MoG1TatsjXommubBJfovVoj04T1bf/Wy/MQqai+ac+yvgXiULL
         aGM9a7hRbYxw1BWhsXJrIi7WjvoTrZ+2B+f0QDukkCKA3QPbcVaNBNfrK7GmBkwlOSwx
         1GjGquDNtKgctscHv0nt0sXm6giKyid8vyKw52KTJzvSKvoYxjxstjlQlwT58RH9DAhd
         iJcJRWdIjBQX0LUaRR9qbgiPiKgdidGzwSI4CCFYWwyqlCLtEVZzCErzl3Y38uXrj2Xf
         dz48uoyom1Ydc5zWO5ouQDcTkXR3z3pAux4y3PNe5KFT0VhRDyzU5AJGNYkzcEDvOEpN
         cm+w==
X-Forwarded-Encrypted: i=1; AKwUvBz2Gj0N/AOZ9FAVbqE1p9Yutqswky2qHlEr+6E80Yh2MdarWmDmn7t7Auh89SzjxpX5Vtk1QNJTtxvGodU=@vger.kernel.org
X-Gm-Message-State: AFuF++m6U942Ou7vj2lwo8VkZPCO0uz1fNyJmWGc1xo8XyDfS407XEHN
	HNIVJx6HXMaUTeBGsofJEVr93Hw1yHYyggh9i33G+va3moK29/4+USV8M5Uu8PFCUwqF8/MjhYY
	KaSW3pulqffgeuqgQEgBnEIw0pFBPQKoBpywUGY4E+PI=
X-Gm-Gg: AYBFou1q15kkDF63Ixq4hg2ML7uytdghJkFBmUdBou+ZfDB9DENPYbMsLBgkWgiaaDr
	BD6PCIwbqgrPeh4JMNe+DuBfhG/5YIXlxgKEsKzdnRHZI7hVT0RqG6juTC9yhCqlqa3MdEmMPnR
	JgrhAHS4KPXKPuimQ4b63g/WZxkCbOE4ESQTplDC5iX/bBk8sEYkqYFTL2eu9eg9whFPOWHUTXR
	xpiygue7ar9AUVGYy21zS8eIrvYh3lKRcKJFWN8vBED4yXITz1rkN89MxQQ+1A1YqiIw2hT3ooy
	VOoIFBhAxAYQiEruydd74EIDSZ0F7sPY61cpJoV/fWWH0wS6J/08x2kSddTMr0QMRFmoM0/EhRE
	=
X-Received: by 2002:a2e:ae18:0:20b0:3a1:8510:cbab with SMTP id
 38308e7fff4ca-3a371f4a7e8mr21960751fa.12.1788667882373; Sat, 05 Sep 2026
 21:11:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <133b6aee9e2c908c9da37d5585b3d2cd016906cd.1788187473.git.zihanx@nebusec.ai>
 <20260905151227.75099-1-horms@kernel.org> <CAANe3eRpVGnYpygfiQTsXd2VmBO43P-P1RfREkdDypgXBZB9Uw@mail.gmail.com>
 <20260905122929.5bd1bd45@kernel.org>
In-Reply-To: <20260905122929.5bd1bd45@kernel.org>
From: zihan xi <zihanx@nebusec.ai>
Date: Sun, 6 Sep 2026 12:11:09 +0800
X-Gm-Features: AcwNN1X4pr4fNZzhfVF2lKYxFSJa-AapKUR7vl8QhdvgCFTfBdfx9ZvtSLVLJBo
Message-ID: <CAANe3eRLauCoiYjxBWGqF0Wz7FxMkNxJcTUaqiD6ZygxcUfUcA@mail.gmail.com>
Subject: Re: [PATCH net 1/1] udp: diag: bound bucket lock hold time
To: Jakub Kicinski <kuba@kernel.org>
Cc: Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, davem@davemloft.net, 
	edumazet@google.com, pabeni@redhat.com, xemul@parallels.com, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, vega@nebusec.ai
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 3:29=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Sat, 5 Sep 2026 23:49:05 +0800 zihan xi wrote:
> > > When an active netlink dump for UDP sockets finishes, inet_diag_dump_=
done()
> > > invokes udp_diag_dump_done(). This function drops its module referenc=
e using
> > > module_put(THIS_MODULE) as its final step.
> > >
> > > If this was the last reference, a concurrent rmmod udp_diag operation=
 can
> > > proceed and unmap the module's text segment before the thread executi=
ng
> > > udp_diag_dump_done() executes its return instruction to return to ine=
t_diag.
> > >
> > > Could this result in a kernel panic due to the CPU attempting to exec=
ute
> > > unmapped memory?
> >
> > Yes.  If that module_put() drops the last reference, rmmod can unmap
> > udp_diag while dump_done() is still returning to inet_diag.
> >
> > I will keep the extra module_get() in udp_diag_dump(), and move the
> > matching module_put() into inet_diag_dump_done() so it runs after the
> > callback has returned.
> >
> > v2 incoming.
>
> FTR your patch also looks atrociously ugly.
> If you send v2 please make it better.

I'll rework it.  v2 will follow tcp_diag's batching and drop the
socket cursor, dump_done callback, and extra module reference.

Thanks,
Zihan

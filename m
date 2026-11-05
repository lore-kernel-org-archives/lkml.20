Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896771;
	b=UGbYBF0bBIomADadrZPnnCymto2kPJGNAarlZfKkln2VWczyXdfWSTZt5cH4mm/gUa6M
	 Jz4aMg99D//vpyoh/0h9hvqfBtapo6DhFcOQyq+QlhMmHBswyDvdkyImuaEHxJ4MJW0D8
	 tU76Rs40NTGmsOb4mE8r+AU9itGqfIN/2de4eR1E1Iu0pfMx/pwursvYu+qnCt6BNFvtx
	 +/u9PXIl4CarUHXRF9q1B8Ktk56k64xq0FJiT90MLJ27tiK2Y0sI5mTgvM+jgIMWWkgzM
	 Vsx0cMb3ogL9Z94EdY9PjCbs2m9JMJuU1Yuy0ORaXgcnvMu+xtcs8tk86WebDnCN/1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896771;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:Date:
	 Message-Id:Cc:Subject:From:To:In-Reply-To:References:
	 Content-Transfer-Encoding:MIME-Version;
	bh=g7fNqjHpYaxkYpPES1WMA+c07Ra73ql25qOjXSvqWMg=;
	b=icFh0PgrF38TfFrhT16mDw98vMefs7tjzVxc76gQnBtK/eLRPckJE52ZmVpnu4PlbTD2
	 nFwFOOfvZRwwPcy2ZWR/Vr7iDbin9h4nto4dS5ttTJ6CiSRFXs/OJLR9EIgXNt4NmnMsi
	 weVx6sHynkkuiXwHZ/LMpci+BivI8D4BntjwQiZkdyVTQJC0GwlizP3x7TmEpFET742XL
	 Z/RjIQwPOYqxqFAsB3AXiPPHHScwMhwlrEyK4sEQbrlAc/TAkka3yeRr7rFK4TmjIEBbp
	 b0jkKFxm9cLbl1WiJWNx3gzeEcS9NhEbJ6KhJ/Yyi28k5DCE27N0Mxr6iOiALQXAmhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Do+25Wfz;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500D2606D810
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:39:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 500D2606D810
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Do+25Wfz
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cdb681de50eso168955a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793896771; x=1794501571; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g7fNqjHpYaxkYpPES1WMA+c07Ra73ql25qOjXSvqWMg=;
        b=Do+25WfzhzV45gI604/1EZvOaKh/pike1eqCQMpc8ex4jx1pAN42T46xblK9HDKHB7
         KBTnLQs3xSuJSR0+hEgKmeAUNfW7AALEE1T+rKSR8y/Wr6GUmZX+ZXbk0/jIIrWIb34e
         Yw9LpdxIJ6RYaq5C4Wj70gFPr5PfoFNw9Wj1rtSjpwyfXfGgNxmzpEWd+pGHumtKX+QO
         k215Bah+78+AZwfWVSUOu39cXJM1slYWKsGxQY1UQiXMh04MxQ3RMSH5gZw9oEmKn7eL
         2b+IzsuxrHs07AWt0ROurkw62JUn2qAQga5a3MNxjUfuy3Fj7jBTvPwu5jCADAyjs7gl
         zT9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793896771; x=1794501571;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g7fNqjHpYaxkYpPES1WMA+c07Ra73ql25qOjXSvqWMg=;
        b=UqxFROnO2eHH3sVX8374yAgUwrrYvLwsp3QKIIS2EJklBvVvxk8GhN7BDTr3HsDeeA
         dA1aJESzajSBltK+nDXXc5vyqYhuJRUig9QZrts7ECsbiAefuN9pSRVpa2zgw+M/4cJV
         t8INUK99nY9qcn5UmOtNa6GOBPHLJ5+Oba570YulOBaq6dvDyUlOjC3/71LWM7buZ9w0
         T7+Trjz9h97Rl2AT/StW0Rmw5FBM4q2V9QoqbZdb9qQdm8Qpkd9bhO5GbbJWb6ojwht3
         QfDcs85y1cDNjhBX/P2ugGnC2PWcmsiPe7e+mPewf5Afil4ptZOoICy77WFqReyBfu9N
         +gPw==
X-Gm-Message-State: APuU4Z+REhKRx+p1ivW+SO+Y1ne5NU43tvD/neX28tsbS+sJgQ34pROY
	nbALLoAOPrv2VUdfStMaLuttnIVNuyvwo+sBSeh0G8R14SZNUfSK1ccF
X-Gm-Gg: AYBFou0dfQhVvgUBTZ5FDD+qlsg4bvHK/lAZdCmnLz9cr65LCUBro8oHtdhahrfTXto
	LFzh5id+H9S9y3KlMW9/i7Bbs4DHu0SVqEZyheDHR/IamCkP0kU6SITmFWcwePXRjRSoTmc/O0a
	ngjLXu5P8nCUKLclHSMSI2BjGWPEsMWDQPKLPlGpRXcBQ6TevOQuMioyXYbjxrr//fS5iyuUXdI
	ctjx/6w/Jb39nqdJ89QEqL78mFkCWOm8eVEh9uagF1v1+WwwcAAmc9Z8X+NuoQ+zdlca+2O4Hkh
	O9R0mDvmN1E3QTEbigx0SHDSAQwL96JQv5PaBqzk7PHSluK0kcvH2g/oiJ/560ZB7Ikh9Tx8TTG
	u3x+1NJ47HOMN+uc/roQV/FembIfZ6Q/LhUqQu3Z0bQnKWrCUebKi4DgZClJfxopORLXzWuH1HA
	mJ2b8jplc1WjHn56rUn+Yd6M67pJsghQkR1x/fq0e7JNgCzgQ/pe6qnB4cPnr3KLH5OCHX3Va/m
	MDn5GzR6RN8pObAsfxgz2VlzIaGMOWyieoAcZv274OVrRnjne+KCBCLw7yWXA6hZlanZ+u6+/UU
	KhRDRjQ+R3Op+5SuX94/E0L1Zi/4HUxy4l+BNgHevq0Ny+RN8GjYZTI9vea10n8suVIzqAde6qt
	vr073BWTyrTshSkjoCSsN/ykj/4DkKSC+W8s=
X-Received: by 2002:a17:90b:4b8a:b0:3a7:8350:3f7e with SMTP id 98e67ed59e1d1-3ae89771679mr16239176a91.44.1793896770403;
        Thu, 05 Nov 2026 08:39:30 -0800 (PST)
Received: from localhost ([153.61.198.243])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b323cd47sm4574863a91.6.2026.11.05.08.39.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 08:39:29 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Nov 2026 16:39:29 +0000
Message-Id: <DMNFBZ04A7IE.1AX8WZ52K8DT8@gmail.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH] bpf: Add network namespace boundary inspection kfuncs
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Abhishek Khade" <abhishekkhade69@gmail.com>, <bpf@vger.kernel.org>,
 <daniel@iogearbox.net>, <andrii@kernel.org>
In-Reply-To: <20261105121642.38019-1-abhishekkhade69@gmail.com>
References: <20261105121642.38019-1-abhishekkhade69@gmail.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Thu, Nov 05, 2026 at 04:16 AM Abhishek Khade <abhishekkhade69@gmail.com> wrote:
> Currently, dereferencing task->nsproxy->net_ns directly via BPF CO-RE
> presents safety and architectural challenges:

No. The prog does all of it today without new kfuncs:

  inum = task->nsproxy->net_ns->ns.inum;
  is_init_net = inum == NET_NS_INIT_INO;

The verifier accepts these loads in tp_btf, fentry and lsm progs.
A load that faults reads zero. It doesn't crash.
NET_NS_INIT_INO is uapi. No need for the address of init_net.
For a socket it's sk->__sk_common.skc_net.net->ns.inum.
Networking progs also have bpf_get_netns_cookie().

> +	rcu_read_lock();
> +	nsproxy = rcu_dereference(task->nsproxy);
> +	if (nsproxy) {
> +		net = READ_ONCE(nsproxy->net_ns);
> +		if (net)
> +			inum = net->ns.inum;

This is a use-after-free when task != current.
So much for 'this is safer than CO-RE' :(

pw-bot: cr

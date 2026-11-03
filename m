Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793697903;
	b=Dd0F2n8lNrYv9oTgn49labE3OXiy/mi0xegTx9nl+/wgMBncnrw/ErEjKi8nLLqVy3za
	 WHmGP0w2Y4MTIV10fMDgRw0VJAJcspibGl2bKIpmz35t2G1Bj3v1+89c2PNOrmlmUH2Yp
	 prg0nr28q/ygH4LuQ+GEwmROw+EKNybqu/lLhHtMw8XyLpUoOHTYp61QsIetUU192xBxf
	 hZCpJCl4qKYIl6Sgzj+kHUIE5f9oxb0nAiC8ntBrBxtt3n5OAlUhBs0sxhDvhENbEjH/y
	 orbMq+e+xKMpyJq+ngunW/2F1tw+i/n94XTryKI0VvOEybsNT4kpMVnv7mCrSQ+YArQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793697903;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=wbk0beb8505pKbqVSOAGuX9uXweKMLn5Ud0DHY7wulE=;
	b=e8TxXkEOcBADVWe3lLNKNIkq5HpSJVzljgA79Weo0E4c6RKJ1WxpKsqG1neGyHJceNuz
	 soV2QvkngdevTrkbrldIQVuxmWrVLnLtEsj+aDwBkJs99uBSmtkrHK9HjCY/iQnNoO+Rq
	 JgNbuB+6P/aJHXyT5X3WmjyxsoGi8KybQ2WlGjXfyWBKIx5Wa9tMAFJThctgfl9fIoxAR
	 BUHHCg3wk2C8fuDzvw6jPnKBe5JlzAI7sDTxL2xmki2hIC/xdVVr0lgqJKnRykfEpQiSF
	 K58KL+6C8JIzdNZVwuOJJEaqFLon99zjrpp51cTMX9+du634WeBSMIkMyegYxNaY3dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=truenas.com;
	spf=pass smtp.mailfrom=truenas.com;
	dkim=pass header.d=truenas.com header.i=@truenas.com header.a=rsa-sha256 header.s=google header.b=azSs5YIB;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD50B606A32F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 09:25:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD50B606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=truenas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=truenas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=truenas.com header.i=@truenas.com header.a=rsa-sha256 header.s=google header.b=azSs5YIB
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso2227301f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 01:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=truenas.com; s=google; t=1793697901; x=1794302701; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wbk0beb8505pKbqVSOAGuX9uXweKMLn5Ud0DHY7wulE=;
        b=azSs5YIBFXuTGlF7dg0vL6KaVS/3uhZ/g8RcFu62bqP+FkfLubAMkn3Qz9+qe/hvrG
         JgVEyJ0XhuWD6j9l1DpBUaqRE4Ab631QZTwYgWCQwyxN0RJ9Pd+eBJIkkGRf9GYmTRf/
         QQWcv2LdmREkInC3DcqotMKPXRcbxJOfeNdIMDRd9YcqUFsjTEHWkSNaBFAUQaEwO6dp
         zcmlLe7UlvwnoYW0CiA59kbJ5UysjW6Q2K0i5hZOBOq/RcOlIi3UE7OqDb3hmR+JH0Su
         1F2DnzzQT9GIGYWpU2drTmsthA754XwyfbGOZXXkSVr+eidKPpCbDm5Ny5a7DO+Pabfk
         I2CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793697901; x=1794302701;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wbk0beb8505pKbqVSOAGuX9uXweKMLn5Ud0DHY7wulE=;
        b=Lpp7anS7nluzZ43nV/Krok52Qzk99jppKdpxLfHmUnciGZuJJE9Mx9bRrL4jjim0SF
         i7ZGs2oTq49t7+04w5SKE1LnTuKC7jtD8NwfH2h/yw5g2OGnNcfdIF7zgqRk9mUhCfZx
         A8c1k9MKnIiODZohB2pjBSSaNwhbZxy63BfDWH0oNjpTfC/JzGMmI815DnjLwmGMgIxT
         Gtxx3oz36zraUJl6HBPYGb7nVMONvzfiMKSpo+NWtV0OAJt7miYNqnPCIrqB2Ghvzhn/
         3PqPFev3X57KzZFTDMjyvRgqu+HsjpnKcxFocSW9rf5PGA6nBAaiA7WsOgjN/dLodwmV
         8rvw==
X-Forwarded-Encrypted: i=1; AKwUvByI5J0duPKheYwI0hLuxAjKv/umlbbxHSrj01L7NCkUysibDgeNuko0ua7ad2A7wDXItgN14R4aCuC4yms=@vger.kernel.org
X-Gm-Message-State: APuU4Z9skyAsjSVZhkjNNh2iICIsahyQXds7brM+tbGGaUywrncA5YqW
	rmR/Adq4p2OWhe7mRuqPOYzTaSt+8NcSY1la/U6rpl5KGpW6PtQjsjPdE97ea+dBkMylPq0Wddf
	AfI0=
X-Gm-Gg: AYBFou0YDy+HnxNg4swsxdFTfd7LzH2PD3XpLMM5eOGkYw+E1RDXZVVoovyW92ai3No
	nESVmbkZ5+zSzclsd98JKSIELrTl2UQeT66SGinEiU5fK3WJBzUu/dDCMFzXEfcuyyOtOZW9Yw8
	hA2g4vRxvvWB2QerpsolZQJ6E2uIYQW3mBH+BuGj54HQFTgDLomfkeuWwV1NmBb40K0UXzANAhu
	hn4SQft2wtPYQcIWLci/c005AHi6OAB4uJl0SSXFvDYfYEKaUMsyxvzewQj+4jI/vHOf365oq9+
	uF+sByZa8r0IYCmTVDSNsPV0VURZHl/s82UPj3dKTmmsEPQgmE94/RzObroWd7q5MtUD1ki/H8w
	oFD2T/ltpFq1mgdi/jajV+QrI4wsYpWbXA6mlcFwUW6N2y5nRneNcrRS36gsudpOmkJXN4FQVws
	Rnw2lqTLi3H3Gh+lpADcvtj4R9kC292lGyUB/b0BhXeyijgOyg/UPi4Uw1obJJWKIHj7dZObzXQ
	Yu+zvhYB1mjy//QDPjJ+/U182MKlh5blEZrKsnT8mXVeY/uMl8NkZuH/0ZvnULMvDvaANlzYgHv
	3E3X/dks
X-Received: by 2002:adf:e18b:0:b0:48e:2949:439 with SMTP id ffacd0b85a97d-48e6e4f5647mr29617079f8f.36.1793697900790;
        Tue, 03 Nov 2026 01:25:00 -0800 (PST)
Received: from hamza-PC ([2400:adc1:158:c700::1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b9a3b1sm25873954f8f.44.2026.11.03.01.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 01:25:00 -0800 (PST)
Date: Tue, 3 Nov 2026 14:24:56 +0500
From: Ameer Hamza <ameer.hamza@truenas.com>
To: Alexander Aring <aahringo@redhat.com>
Cc: David Teigland <teigland@redhat.com>, gfs2@lists.linux.dev, 
	linux-kernel@vger.kernel.org, caleb.stjohn@truenas.com
Subject: Re: [PATCH] dlm: don't set RSB_MASTER_UNCERTAIN on rsb with no master
Message-ID: <aumi85ZXHFQ_D5ON@hamza-PC>
References: <20261019151627.3324886-1-ameer.hamza@truenas.com>
 <CAK-6q+j64=mSzuufOaSGjsC2aSwhb0hs9MKxxaAhbwugdztHZw@mail.gmail.com>
 <aujr6x9t2gXbXfFw@hamza-PC>
 <CAK-6q+jBNKN=oSCmm+i011FdhPS+42BZc0iUfbqGiLDBc0Py5A@mail.gmail.com>
 <auj4LE0bq7w7lOF8@hamza-PC>
 <CAK-6q+gqM6O4h762H5NVJ_B==VL2zaBVTBDiwUdbf5zxGNEDsA@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK-6q+gqM6O4h762H5NVJ_B==VL2zaBVTBDiwUdbf5zxGNEDsA@mail.gmail.com>

On Mon, Nov 02, 2026 at 05:22:54PM -0500, Alexander Aring wrote:
> Hi,
> 
> On Mon, Nov 2, 2026 at 4:03 PM Ameer Hamza <ameer.hamza@truenas.com> wrote:
> >
> > On Mon, Nov 02, 2026 at 03:38:12PM -0500, Alexander Aring wrote:
> > > Hi,
> > >
> > > On Mon, Nov 2, 2026 at 3:03 PM Ameer Hamza <ameer.hamza@truenas.com> wrote:
> > > >
> > > > On Mon, Nov 02, 2026 at 02:49:04PM -0500, Alexander Aring wrote:
> > > > > question:
> > > > >
> > > > > how do you "pause" anything in DLM?
> > > >
> > > > The nodes are VMs, so I freeze the dir node from the QEMU monitor. It
> > > > stays a member but never answers the lookup, and after the cancel I
> > > > evict it through configfs. That is what happens on our HA systems when
> > > > the peer reboots without leaving the lockspace and a pending request
> > > > gets cancelled before the peer is evicted.
> > >
> > > Still, do you just randomly freeze it, or do you busy/poll wait on
> > > specific struct field changes?
> >
> > I don't poll anything. The peer is frozen before the request is made,
> > so the lookup to it can never complete. Then the request is cancelled,
> > the peer is evicted and the name is requested again, and it asserts
> > every time.
> >
> 
> I see, do you use dlm_controld/corosync as cluster manager?
> 
> I would assume at some point they should fence the frozen peer.

No, our HA manages the lockspace itself through the same configfs and
sysfs interface dlm_controld uses, with its own peer monitoring. The
peer does get evicted, but the monitoring first waits about a minute
in case it comes back, and the lockspace keeps running until then. The
requester cancels after 60 s, so the cancel can arrive before the
eviction.

Best Regards,
Ameer Hamza

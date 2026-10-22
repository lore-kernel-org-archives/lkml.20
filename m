Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792633498;
	b=j7S3ow4unK5i8Duuhqsbev4B3Va6J5wA/8+MGbC5ciDjXw7fNDE6Uw1SKlkfuw47Q2/x
	 50ekiFC7iXNk+Q7tdRrphaaZh04vafvXtZmuq3uqMb4oik0zACFnOPSh2TBUU5ahmSc4f
	 Xcfg3SNmXR7qa1hTmU4tU6zSL48ACNH1YSSklKVlbSYz9LixIITjRLtFiDNrN18TWDe1F
	 TiPSJcbJb3gNKQZ8MCBOfed1csK5dUvMV9+2DCpOOGON0ANvNXh3D3evp6MIe3N465Xaa
	 4MAMgEY7Hi5jf031NB3JRtHdBA7EAw5heL7F5SPayytjliKbPsITmT/AEMOJp3NkATw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792633498;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=LS+EicQQq2YSXAcv/CHPjd9x8RnM4wjQksgtpzHAKuY=;
	b=Zv+14pPxKGxF1yzIQMnQdgboRmYV1LYG4HOifN0/MsTIjVgEjfyTssjF8ri83CduKVgu
	 4HZT9WJxjupoD4kLuE5DSZqaqQmrFT0apOhpRmSpmTkhluCsGUFSJlCxhK0IbiOh3Ie3u
	 inRbNYgZfP7MDOwiOuOzU4qqISTeSaSI7ZX0MFO2IVgGQHvGEB17s3bIOUq0oYwCAgM1Y
	 3RVSLC3zpd/Gw+9SodSAvWwl1KfYGWJRt34Skd0HOk8BLwKH3552L/2RmbKZvO1kK/yoD
	 xkX1Qe9A50UBuzgS06DoO6YtBoNnCxQyXyC4dKiIvy+V4fJz9j4CtAkhojYf5RKW8pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=a29lh53a;
	arc=none smtp.remote-ip=209.85.221.170
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B9D606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:44:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66B9D606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=a29lh53a
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5eaeb7fdda2so1177037e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 18:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792633497; x=1793238297; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LS+EicQQq2YSXAcv/CHPjd9x8RnM4wjQksgtpzHAKuY=;
        b=a29lh53aOFaSgInPOugDA6w3Jxk/dM2bSqceVpUB1dbglXI1+ELHAJGS7w2fsRTr4q
         6TAXei2sXE2XqwdLXz3TcBmgIHXdvBezAlwKzO3CzCoYzGnbiFhJU4u5LP4TQbgoh7Qp
         gXme3XEx7bUQ5RMQRx3aoKlPOhJjBWgP8u2PYAUVT0bzcIO6Rqp+C9ozSPPQbt+tb0lu
         WU6COpW6eEAVCYF8P/WwoqE7y3FrRjl8zrnFiUtTH4oQ3OYrwT12iNdbESAhCpmw3PzN
         FJ8pFxNrOjfSvdi8UTSv1KwIpnpsqVPkliYbSZJYy6/A8m9+III59H5neFGpYyvM+P8K
         YblA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792633497; x=1793238297;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LS+EicQQq2YSXAcv/CHPjd9x8RnM4wjQksgtpzHAKuY=;
        b=mT+IN6gnNJE2Ejuio2VRrWSOo2OHAn66OipaFa88FwaI4JiPMZJBfbklzYcHOzCxQT
         EHWIOtSIZPW0g5recyb1+QVauUdUsaiHb4h/OsdZ25NEWG95mq6iVS6yW8kSnk2i/VLa
         7VxPnUrtX3hIEmWQ3fMhPr2Va/dbgoyq6/EJe9zJ7a1t8xB4uF1TsKVsA7idg/WgMSZO
         E2S14DXquFMUhCTtAOKcjFijzjuro88JaD0d2xaMdO/33bjDHppP7wh0Sy9wRti/yRqp
         6p7juRxmww/Biik4J5i1A/igK2ZvL83w8QkhUGH9cm6+5b9cKMtv3xfRqaAUF+Hl2WzF
         /szQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKHWswnLJpUQRTkMhMOK47wo3ZGahnFkRHcMjGIHwUdc9zDfP3Svucz4knm5oXN87biO6i9iOi/puu0cE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIodmnoEeo8UvFq5cjvFKZ6HRVA0gzdxK/EALPKj1SgcqUEJSyp
	4JsMlInV4gk7puv9eITzaAuHP2FbKJkkY+ML98AX0AlUtt7ZK+FB2nTEVMarMMtyNzg=
X-Gm-Gg: AYBFou1f5GzUA6HkGNYxnjwBJvhCuacGoLhVrl8QCerkOoApkegN55toNs3F8Th7k3g
	zUdl5WHZuKld1LXqH8/LOOzwlhsMMigmiFAlkDpz2Xvh34kgkOrzhKa8MLEfSPF2vBsJe1I048G
	nn2b/ByyytUeutxqwyDM2xbMAxrttve+kmJZicP41HrywdFkm2G9iK5nyw4iwHSx+IJkQOjhthx
	FkuYgJJYym4WapapDqROTKVwqUJJdUrOfsCo/ERp86s39bixsWsNQRIgsf6GKXE0iheNRb5A70r
	N0Pgdzy7EvYF5sN1K6gXOaFUYdn+slE2u+6zZZQ6vltgHxcGQZmRouQjFcMOtcd9jQuXSwesUzl
	MdbadNN3es4/Hpg3rRQxtWwrPZrwT5luK3xhTmeKe/M+RcfDbVSWmiqsNWiY3zjFB2WVmDvcMwC
	s0kCmsvGYC/PusRc7HdQt3C3RtNAonJ29phniXhnOQTI3mT2dHR6tfnsyrye19/DU3iMmkiR3y8
	kAj9KpDqtEKiIswdzGH62J9Ovbomvr49/GO1BVvJ0XBRqPX9Nh5YtcW2A2eLCcFl9w9iSB9mwp9
	JTeAGb3+JhXBdby/D8/Q8c/ARNpLbyErlC2UlMM3lu6JChcs90CxJDVyGzO2Ma5I0CdJB9pwNHs
	rTA==
X-Received: by 2002:a05:6102:418a:b0:7be:25d4:7ff0 with SMTP id ada2fe7eead31-7cc92469ecdmr1660230137.4.1792633497085;
        Wed, 21 Oct 2026 18:44:57 -0700 (PDT)
Received: from google.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990d104017bsm4933026241.4.2026.10.21.18.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 18:44:55 -0700 (PDT)
Date: Wed, 21 Oct 2026 21:44:55 -0400
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,
	linux-kselftest@vger.kernel.org, rppt@kernel.org, shuah@kernel.org,
	akpm@linux-foundation.org, linux-mm@kvack.org, vipinsh@google.com,
	linux-kernel@vger.kernel.org, dmatlack@google.com,
	kexec@lists.infradead.org, graf@amazon.com
Subject: Re: [PATCH v2 1/2] liveupdate: Add LIVEUPDATE_SESSION_FREEZE ioctl
 to freeze sessions early
Message-ID: <atlql8V0YcXGRxS3@google.com>
References: <20261020144710.4154339-1-pasha.tatashin@soleen.com>
 <20261020144710.4154339-2-pasha.tatashin@soleen.com>
 <2vxz4iefgy36.fsf@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2vxz4iefgy36.fsf@kernel.org>

On 10-21 12:14, Pratyush Yadav wrote:
> On Tue, Oct 20 2026, Pasha Tatashin wrote:
> 
> > Currently, LUO sessions are frozen automatically only inside the
> > reboot(LINUX_REBOOT_CMD_KEXEC) pathway, where luo_session_serialize()
> > iterates through all outgoing sessions under global write locks and
> > freezes them serially during shutdown. Allowing userspace to decide when
> > to freeze a session once it is done with it (and to freeze multiple
> > sessions in parallel, since luo_session_freeze() only acquires the
> > per-session mutex) avoids postponing this work to kexec shutdown and
> > reduces blackout time.
> >
> > Introduce LIVEUPDATE_SESSION_FREEZE on session file descriptors to freeze
> > a session early. The ioctl runs .freeze() across all preserved files in the
> > session and serializes their metadata. Once frozen, no additional files can
> > be added to the session, and subsequent freeze calls return -EBUSY. Freeze
> > is only valid on outgoing sessions and returns -EINVAL on incoming ones.
> >
> > During kexec, sessions that were already frozen early are skipped, while
> > sessions that did not invoke this ioctl auto-freeze as before. If an
> > early-frozen session is released before kexec, its files are rolled back
> > via .unfreeze() before being unpreserved.
> >
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> [...]
> > @@ -218,18 +219,33 @@ static int luo_session_finish_one(struct luo_session *session)
> >  	return luo_file_finish(&session->file_set);
> >  }
> >  
> > -static void luo_session_unfreeze_one(struct luo_session *session,
> > -				     struct luo_session_ser *ser)
> > +static void luo_session_unserialize_one(struct luo_session *session,
> > +					struct luo_session_ser *ser)
> >  {
> >  	guard(mutex)(&session->mutex);
> > -	luo_file_unfreeze(&session->file_set, &ser->file_set_ser);
> > +	if (!session->frozen)
> > +		luo_file_unfreeze(&session->file_set);
> 
> "Wait, this looks wrong. If session is not frozen then unfreeze it?
> Should be the other way round, right?"
> 
> This was my first reaction until I realized that you only unfreeze
> _automatically_ frozen sessions. User-frozen sessions stay frozen. Which
> makes sense, but is not obvious at all.
> 
> Perhaps rename this to session->user_frozen and add a comment here?
> 
> With that fixed, feel free to add
> 
> Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

Thank you, I am going to send out a new version soon.

Pasha

> 
> > +	memset(ser, 0, sizeof(*ser));
> >  }
> >  
> > -static int luo_session_freeze_one(struct luo_session *session,
> > -				  struct luo_session_ser *ser)
> > +static int luo_session_serialize_one(struct luo_session *session,
> > +				     struct luo_session_ser *ser)
> >  {
> > +	int err;
> > +
> >  	guard(mutex)(&session->mutex);
> > -	return luo_file_freeze(&session->file_set, &ser->file_set_ser);
> > +	if (!session->frozen) {
> > +		err = luo_file_freeze(&session->file_set);
> > +		if (err)
> > +			return err;
> > +	}
> > +
> > +	strscpy(ser->name, session->name, sizeof(ser->name));
> > +	ser->file_set_ser.count = session->file_set.count;
> > +	ser->file_set_ser.files =
> > +		kho_block_set_head_pa(&session->file_set.block_set);
> > +
> > +	return 0;
> >  }
> >  
> >  static int luo_session_release(struct inode *inodep, struct file *filep)
> [...]
> > @@ -267,6 +286,9 @@ static int luo_session_preserve_fd(struct luo_session *session,
> >  	int err;
> >  
> >  	guard(mutex)(&session->mutex);
> > +	if (session->frozen)
> > +		return -EBUSY;
> > +
> >  	err = luo_preserve_file(&session->file_set, argp->token, argp->fd);
> >  	if (err)
> >  		return err;
> > @@ -340,11 +362,40 @@ static int luo_session_get_name(struct luo_session *session,
> >  	return luo_ucmd_respond(ucmd, sizeof(*argp));
> >  }
> >  
> > +static int luo_session_freeze(struct luo_session *session,
> > +			      struct luo_ucmd *ucmd)
> > +{
> > +	struct liveupdate_session_freeze *argp = ucmd->cmd;
> > +	int err;
> > +
> > +	if (argp->reserved)
> > +		return -EINVAL;
> > +
> > +	guard(mutex)(&session->mutex);
> > +	if (session->frozen)
> > +		return -EBUSY;
> > +
> > +	err = luo_file_freeze(&session->file_set);
> > +	if (err)
> > +		return err;
> > +
> > +	err = luo_ucmd_respond(ucmd, sizeof(*argp));
> > +	if (err) {
> > +		luo_file_unfreeze(&session->file_set);
> > +		return err;
> > +	}
> > +
> > +	session->frozen = true;
> > +
> > +	return 0;
> > +}
> > +
> >  union ucmd_buffer {
> >  	struct liveupdate_session_finish finish;
> >  	struct liveupdate_session_preserve_fd preserve;
> >  	struct liveupdate_session_retrieve_fd retrieve;
> >  	struct liveupdate_session_get_name get_name;
> > +	struct liveupdate_session_freeze freeze;
> >  };
> >  
> >  /* Type of sessions the ioctl applies to. */
> [...]
> 
> -- 
> Regards,
> Pratyush Yadav

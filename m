Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CD04C77A8
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788447913; cv=pass; b=oTymBbHdEMUE/mLdJoV/SyQZPVs2jxiG2C1WLKjALz9emaRvSyFfUWFL2JGP60yTJHJJGlHrwcZ0/a0BZd3GZIxSJ88ThUDXQgPZcxSxXpxWME19afoKSZQMOg8mP7ipHF6SFnmuf4RfMzBE0I8QyiOA9ZqeARGKN+cFZzvZhAI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788447913; c=relaxed/simple;
	bh=4q4IXvGFS1je+kmtMxtVxp6SUGEMuEGHLWMMjl8iKrY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mOMxwRhqbkr4gTeZSdSIG3ZwUpVw+YnbvGH2jQ+ocU9AWKPOpJsZgGMpr9UgvwUWcX1aGL4QcqUmdv1gI+3MHAUwQnvCN47vBXZePjixE3DUBPlpJRrm028SvN7t62+Xpg+otiX2wyqdKinBiLGIdlkuhSoCSvdJf2Va5FqbxmQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E/Vhesde; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E/Vhesde"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a5f60cf491so357295a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:05:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788447910; cv=none;
        d=google.com; s=arc-20260327;
        b=EffjGMbrrIfstKYQieFAZ59dfXT9wgDDU4W0QPkzFedvEkiYzkTfZntiI2nLyTRHNW
         JUelm1A1FWIX0gsF+UZeLg5xIHld+Goy4853UF+/IAEX7s9gpoR61Xwz/lc9ZDZYuz6n
         VhPNQBQ40bk6sXedD2vMcPu2VTeffPSQvQ14alEJNTwSXjwsiqVKpBOwPjze/dRbKh+V
         45TzYG5uuNlCQw92lye9CCvYcd7dpUWEClEsHqwHm7Bsf3bbt0QXrqLT8vURKVAtZQD7
         iZhUr/Rv0IDwruTuWf7bl+hQfBQYzGVwryet7TVDNSeY0DPhP5/kWMBdKyh7iteNzW8M
         LITQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i5SLiJDT8dYeZ0O4WC0uETnJaFZZU8+dsHXxBxn1pFs=;
        fh=VsmijiqzEirSXCqcfm/1OhTiDS1kfjaObqYf0P2DfPw=;
        b=HFHmK1dZcC+R0dbV+k5BUAWeLRwcDuKSWfyDs3+QnyJWU8HHKpNSO8Ug6ZQAYXPZ5y
         iAMdHLBrBDTwbQwij63RHZ9Zl9rCnGLpnZsyqmAoMEILUbG+Q2gNDkJpSxAT5Qbb7zZE
         VEJTrBd+IOyCu7LIh8acfeGojC6hSqlUgYY7emo6b1Lx4QyCXiHptRL9rKnCW1WcUcau
         SkbyulQ8w6KEtCIT3mnWCzfaL4sup84BiqyH4kdr8k9ZnnIeiVk5jqSwoCwJpiZYcCel
         vgwNDCKV5UxpyRIWAnfMPwzg/fYUET4MXDiRNUwiMut4uQqwdFrX1BIkDqw5t/j1cKIS
         ilXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788447910; x=1789052710; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i5SLiJDT8dYeZ0O4WC0uETnJaFZZU8+dsHXxBxn1pFs=;
        b=E/VhesdeSioi8675VwkSfw1TnHAos/DXfOUQs/20uPH0jCYyXSruAStZ6Y7CSf9Lzs
         wRxkj6z4wUmzN0YbA3TnXhIbwC5XXJI7+VeWIDzX6Egjm6ZBTnXCnrg1D48tbRawW5eE
         vH6DiFLJ2c8RWHyT9iDoMCeUHl7A9vv0sdTLVLPMqe02EPm1eAA5MsXj3souOPfOeRSl
         jTNlbCh4QOE3vw/J6v7NULsfkhu6cF8MyyGMNKEcea969v/vpS3pur9HB75Kzmp99A0V
         0Wk46dSzL9DkMnqxjKmv7cne6Wr/yJ5P2mJ/1EQD50PP3jRgP+2zDoMsh5afiqH3FN6b
         Laww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788447910; x=1789052710;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i5SLiJDT8dYeZ0O4WC0uETnJaFZZU8+dsHXxBxn1pFs=;
        b=XVxlGx6Nu8uAM+5fF9wxbLk+2+d50yyckYK/clSJ9gtCaF1GLUCmaRJDHX9MxAp3KP
         sjysR3EybzJq8Y3OUBkFAPgSQM1OHdhzknxxd5a8dKdI8U09lRzJOwgcZ7pfpI+lpAR8
         xTrqmtkJErB1aqN2PMTcN5vbCXF8It1LaJ5nZNDy7BzRLeLZimd12kU7dfoGv2yYHgMN
         tfzMVLYsvKlP1MU/kgUaSOGCzi2zpSOzg455FIYWyOOOfMNwl7FcykwlXJIDrOJOPA2D
         zojZJ9Tdb0s1FQ6z1hLexWLDsCIl9vp1MgCdegBkBLYi9wgSIdDFMUXTrcqTlfnyJ2Aw
         lU9g==
X-Forwarded-Encrypted: i=1; AKwUvByWjuodr4qNcHkLK+R/TvsqQz35A/MxMOHi7aQ45bQiRp0eAb3Tdn4qeN0U7kBJ0IRf4+nvWDP8wsi0bN4=@vger.kernel.org
X-Gm-Message-State: AFuF++kMBOZExNItEldJ6DIAyoMSGMiVcY6lX3GHmaBU1U70eifzipv4
	CghWT+X3AR8CRR/SdqY4IoFY84JWahmGMTm+ZTqFbytDTOB4VxSFyRc/iV5kBBo0vk2kvi5CKFZ
	+FwwOu7zxUJ60ZIoZ0U7sn6CjbSKZEoA=
X-Gm-Gg: AYBFou37k0QAFvq+ya3MCtxgjX+bmUw3yq3N17OoQzMPtw9uJ74vap7Uam7DH8jsuN3
	6YjSoy1Gs/hR7i2ihDwxo0iMLt/mNas7qa+grTt/h12rCR5BhF+NAFEjsdrkUdb4GzxyFBaI17T
	WdugaBhwEjGtnP6ybSjksfNC2ROOAEdKMtK9VLD8mvIpz2MyvJldtUU6tVbcXdgox3ivFeIDW7F
	vdLayfoHWXa8aDv8rSywUwHUqwCAnOmyG1sgHykW9mMyOiIxOhnSOEp3DHniJTYCt5V3cDDCxj0
	zdYr8u2NifqeUbxyVwLqnSeNqBdwdFUgIF7aWzLLtzB0VRmnyL8owlaNBAZno2d29vsbzNWXWUc
	=
X-Received: by 2002:a05:6402:210c:b0:6a3:eb13:e74c with SMTP id
 4fb4d7f45d1cf-6a682566928mr4744518a12.1.1788447909273; Thu, 03 Sep 2026
 08:05:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824150220.216067-1-nicoyip.dev@gmail.com> <20260903090735.GJ396647@horms.kernel.org>
In-Reply-To: <20260903090735.GJ396647@horms.kernel.org>
From: Chengfeng Ye <nicoyip.dev@gmail.com>
Date: Thu, 3 Sep 2026 23:04:57 +0800
X-Gm-Features: AcwNN1Wrp-obIQ2bxnzyzJpQtKbgTJ_hGKNFFoDg3LkB4NYMTxWvuZeQuT3hGx4
Message-ID: <CAAo+4rXkcmzOZL8nU4re6Pyp+FSXumjvVUM91vnrKDqMYt==2w@mail.gmail.com>
Subject: Re: [PATCH net] rxrpc: Take write lock when publishing the initial
 RxGK key
To: Simon Horman <horms@kernel.org>
Cc: David Howells <dhowells@redhat.com>, Marc Dionne <marc.dionne@auristor.com>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-afs@lists.infradead.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 5:07=E2=80=AFPM Simon Horman <horms@kernel.org> wrot=
e:
>
> On Mon, Aug 24, 2026 at 11:02:20PM +0800, Chengfeng Ye wrote:
> > rxgk_rekey() updates the transport-key ring under security_use_lock,
> > and rxgk_get_key() takes a reference under the corresponding read
> > lock.  The initial publication in rxgk_init_connection_security()
> > writes conn->rxgk.enctype and conn->rxgk.keys[] without the write
> > lock.
> >
> > On a client connection, a second sendmsg can observe
> > RXRPC_CONN_CLIENT through a lockless load of conn->state, skip
> > rxrpc_init_client_conn_security(), and call rxgk_get_key() without
> > ever acquiring security_lock.  Because the initializer never took
> > the write lock, the reader's read lock provides neither exclusion
> > nor a matching acquire-release pair.
> >
> > Concurrent RxGK key consumers were observed in a two-sender
> > workload.  KCSAN reported:
> >
> >   BUG: KCSAN: data-race in rxgk_get_key / rxgk_secure_packet
> >
> >   write to 0xffff8aef4023c318 of 8 bytes by task 1968 on cpu 0:
> >    rxgk_secure_packet+0x46c/0x820
> >    rxrpc_send_data+0x562/0x1a20
> >    rxrpc_do_sendmsg+0x976/0xa80
> >    rxrpc_sendmsg+0x20f/0x2a0
> >
> >   read to 0xffff8aef4023c318 of 8 bytes by task 1969 on cpu 1:
> >    rxgk_get_key+0x209/0x5e0
> >    rxgk_alloc_txbuf+0xa4/0x2a0
> >    rxrpc_send_data+0x8e2/0x1a20
> >    rxrpc_do_sendmsg+0x976/0xa80
> >    rxrpc_sendmsg+0x20f/0x2a0
> >
> >   value changed: 0x7fffffffffffffff -> 0x7fffffffffffffee
> >
> > That report is on the key context's byte counter rather than the
> > initial publication, but it shows that lookup and secured transmit
> > already overlap on the same connection.
> >
> > Take security_use_lock for writing while publishing the initial
> > enctype and transport key, matching the locking used when rekeying.
> >
>
> I think a Fixes tag is needed here, citing the patch where
> this problem first manifested.
>
> You can simply post it in response to this email.
> But if you do re-post for some other reason note that
> there should not be a blank line between the Fixes and
> Signed-off-by tags (or between any other tags).
>
> > Signed-off-by: Chengfeng Ye <nicoyip.dev@gmail.com>
>
> ...

Thanks for the review.

Fixes: 9d1d2b59341f ("rxrpc: rxgk: Implement the yfs-rxgk security
class (GSSAPI)")

Best regards,
Chengfeng

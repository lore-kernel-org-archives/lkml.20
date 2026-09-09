Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0D556B852
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 13:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788961070; cv=none; b=rJt3TLozjQ4x5hwcEIs5TOrD05GP75RfybQM6Hgmzv55rEqYQramOl5hKpKnIZaq2xs9OVo3qdZp4nn3404M8weJroKZgN/aR67mQQ1yOhXaZduRVIcyUMaI8F4xmOT+9FO3NHyErrkv2kn0ZqL7KM7n7EdTJ+GnKBfJXf0aCVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788961070; c=relaxed/simple;
	bh=lb5aVTc3kVp2JW4FFWVMPr/dMA6Nhe4a8BGZQ173xNo=;
	h=Date:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q2GZwH1hpCeLrnGVQJ+MDJSAmCiX+RLs5hieXV72xvCnaMNxC2asioAlzFjPOfuf8cJdcqyY4LK+SW06L/yeb5c3QDn/gmk9iYXBlvD4o6jEzYcGx17zb1Bj0ZK/QkZWsItgVIuNB8RRYpmyDLWK2qoAMDc2fSuCKrors9Mtcrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QyNuIBb7; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QyNuIBb7"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466cc9ab650so201481fac.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 06:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788961068; x=1789565868; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:from:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/DTYKNyRmxCl3EoBhJoRDEuVPa/z1zrM8kn9PHwX7QQ=;
        b=QyNuIBb7NE0flwaGwAK5EO12mi5iL+WxuxAOevDrNza1z2ETN40sqX3JU2ZGiyyDPY
         /tDO+sUtXShQ3HG7SDj7jKG6LHiGbxVUsP/XulT+Aq6KS7+jeSj2ZaCuP+/+WNI0h3ey
         koz7OF4cwu9ScH1bT6bPgR5osrfxuSl5DkVC9pjcnUGyUX0VlPnQLqZSUaZZ5q1kmzha
         GC09slJgxwvLvdNsbTDhl3Q+4c1snT9IDOXlP8AFfBfxKPvrkDDmde+KVAbQArBETJJZ
         PsH33zls6PO9d2qqexz8T3voqBxovzndzKRwMtUKVKKwjfS8YeSpXLffNguAs7f9oWOQ
         u0mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788961068; x=1789565868;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/DTYKNyRmxCl3EoBhJoRDEuVPa/z1zrM8kn9PHwX7QQ=;
        b=ncSIU6jmNqxSRGudRU4p7oeIgT8WJcxibHkQN1zztNd0jfsp4skiOWvcMz3S2QQ8I5
         s1/xy2CgTSnlitwD/W1HbyY+8mQ4RdkSrQpP80YqJZuBDFH6UESqUJzRbqnPqZN66BeL
         JHvuK8zCidtZhvIjWHVrIsuPsXKkS3JtR5QfAcFAMLb+Z0ykaVeh+VX5ndeE49Xjh/Ym
         qXmu8anufwD5cUSDXCqTWfI16hTDnCLHvYl4SVEQ7OQEE4G2XEuwMlX2mULk3KBlgBl2
         AOBCVxs5v1o3x9Wl9hvum3hVztDI+CozmUklBYINholkTM7EOS4N5DcKmJKaB5iwwtky
         MHig==
X-Forwarded-Encrypted: i=1; AKwUvBxff/qwVhDhlWar+BBjhKV7VK8JlglkwXZe2GYonoSIhLX/yWpxBCWqEbCSF9MMnVUNp382NmkhLtRuh/Q=@vger.kernel.org
X-Gm-Message-State: AFuF++n2K1hqOscqGQ3p3vlvhxfQ0gBRrDnvxyMuKuI1XLNpDQgDoj4U
	khp0yA00SlDvV+NGYg54iAoG2cAPaaL6UF+ME4MQctwB8PrwZKj0/jv5
X-Gm-Gg: AYBFou0gsY5YfYEEDGHaG0m9GHuf/0dnN6MafNzKj8VmqLNKxkZt8hRaNt2HuUx6x/e
	V6u6p2VRQgHvH60GzLck38htAoDpGl4v0pZMjNytOst8ssMocx4OfQ/Q26YOjrLd6zbTwuvC9fl
	/uymXeecqvGQpNEjF+cKFCphuEYCkqWOgDv+VxTLkNsccnvQ8LbZSEvLme9n2bJhEoPUr0wgR26
	A7GkO6hT/yBLLWkQnZFUbm/fskAbu3ec6Tk3ToImMKPRnsCqRVTBYP6cEGiy5gtiwbBgscOZzEB
	tSGd2RqN5WPDoaF3tg9RsRySe37TN+stqf9PEdn8RYRGS9JbAK45OSXYByccWP3iVrnwvBLJvyn
	PNBytRwMOlBGsD534SQsm8vq5CTAjj+VpsEZWLrfbbvTrRadKjcwvK8JJ1pS1a/qhs4Y7aBjCYt
	5av6X3ZvlS1ZYppDnDny5N8cRfD+EZj/FG4oBXdeN2MEQffp3kBW3ceKzaObNA4dhwhilhvaX9a
	SSk+18D/L39zD8=
X-Received: by 2002:a05:6870:80c9:b0:475:a153:2dc7 with SMTP id 586e51a60fabf-47c51e7166fmr456675fac.29.1788961067894;
        Wed, 09 Sep 2026 06:37:47 -0700 (PDT)
Received: from isaac-aneek-MS-7C52 ([103.74.86.148])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47bc86aa06dsm1591299fac.18.2026.09.09.06.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:37:47 -0700 (PDT)
Date: Wed, 9 Sep 2026 19:37:36 +0600
From: Isaac Aneek Sarker <alvasarker2004@gmail.com>
Cc: alvasarker2004@gmail.com, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Nikolay Kulikov <nikolayof23@gmail.com>,
 Andrei Khomenkov <khomenkov@mailbox.org>, Dalvin-Ehinoma Noah Aiguobas
 <fliegbert2@gmail.com>, Khushal Chitturi <khushalchitturi@gmail.com>, Minu
 Jin <s9430939@naver.com>, Anirban Bose <boses156@gmail.com>, Khasar
 Munkh-Erdene <02khasar@gmail.com>, Jennifer Guo <guojy.bj@gmail.com>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix unnecessary else block with
 only a break statement
Message-ID: <20260909193736.3d7a851a@isaac-aneek-MS-7C52>
In-Reply-To: <2026090924-tiger-unaudited-e9f3@gregkh>
References: <20260909083010.13064-1-alvasarker2004@gmail.com>
	<2026090924-tiger-unaudited-e9f3@gregkh>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 9 Sep 2026 11:33:49 +0200
Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> On Wed, Sep 09, 2026 at 02:29:38PM +0600, Isaac Aneek Sarker wrote:
> > Warning found by checkpatch.pl : else is not generally useful after a
> > break or return. The function would reach the break statement after
> > if-elseif block even if the else block is not used.
> > 
> > Signed-off-by: Isaac Aneek Sarker <alvasarker2004@gmail.com>
> > ---
> >  drivers/staging/rtl8723bs/core/rtw_recv.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
> > index 3c82012fdc6c..a203ef8bd6f6 100644
> > --- a/drivers/staging/rtl8723bs/core/rtw_recv.c
> > +++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
> > @@ -1789,8 +1789,8 @@ static int enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl, un
> >  			/* Duplicate entry is found!! Do not insert current entry. */
> >  			/* spin_unlock_irqrestore(&ppending_recvframe_queue->lock, irql); */
> >  			return false;
> > -		else
> > -			break;
> > +
> > +		break;
> 
> Did you test this code?  It looks like you now just changed the logic a
> lot, right?
> 
> thanks,
> 
> greg k-h

No I didn't test the code. And I don't have the required hardware. But I would like to know what are widely used test methods in linux kernel dev to test a driver when you don't have the relevant hardware vs when you have one for and finally test the code. At first it seemed a trivial change to me because that else block would only execute if the if-elseif block didnt execute, which made me come to the decision that the else block was unnecessary.

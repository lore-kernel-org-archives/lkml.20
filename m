Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792521911;
	b=pDhdaeWwZfhPDMX9OouhZfizQjOGYTIHcXPkpqe+naCWi8RmPZbZ/dLk+hsz8SOQH5Dj
	 ycWkAsUGa1OYd1e0DB4Wf1regU45YSVoz/q6N2CqtyO/gWcteRBEImNKn5g5LXToEv5uC
	 amrcYZ8XG/5YTuT4LGHrf7aUJvCGzqqEgIoLOpvVoZOzsb/EswIvNhmRts6bWb3psrCw5
	 jqy+Caw9sRmVuhpLhEfYBupgYovMfu2VZFkhaqfqn447j/sZdIdozt298brxvimKyso5n
	 xVAPqrdV0gVZ43GrPQJuSvo/NvWdci8BFwhaJBbLJNR4xr+RsoZxwjVcTrVWmA+Pcbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792521911;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type:Content-Transfer-Encoding;
	bh=4dEKJiz7qNn7fsOJLiI2+hUQgs9ULSFP/CeGMQxc8t8=;
	b=cyWHEljgJiU+fXGupZDj/Fl8Gd2+ocVZWAlRERSTS7koabq9m6Ka4XQSzSkBD168luQK
	 wNgPbGgYpUEd8F64RYaKEvWHMJCW9/qEC3Kg42+rb8RLAs969GTkWC9yTJe3iQhWzlXZM
	 kny1ycHGSIKPiBQ1DbsALoV1PWd44Tjm5Y3BuaCJMtKRaJ3SySS96FJ5aziWsRookm1lo
	 ue5Wwt/tQ84Ma/ZA6ZxTp+sqZTYWLWhqT5WXAJjMtYd5XFNbjP7UTJ11ZpmdoCKEZbG0e
	 pUkG/T3vW46DI5SwGqYAltNG0ViEnst35fB5MLrCyE9tiW4IzvaARwzGFuldauDBfEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fastmail.com;
	spf=pass smtp.mailfrom=fastmail.com;
	dkim=pass header.d=fastmail.com header.i=@fastmail.com header.a=rsa-sha256 header.s=fm2 header.b=ikppvGeZ;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=F+rvf0FS;
	arc=none smtp.remote-ip=202.12.124.145
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D01606A320
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:45:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5D01606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fastmail.com header.i=@fastmail.com header.a=rsa-sha256 header.s=fm2 header.b=ikppvGeZ;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=F+rvf0FS
Received: from ams-compute-01.internal (ams-compute-01.internal [10.64.2.61])
	by mailfout.stl.internal (Postfix) with ESMTP id 24B0C1D00022
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:45:10 -0400 (EDT)
Received: from ams-imap-15 ([10.64.2.35])
  by ams-compute-01.internal (MEProxy); Tue, 20 Oct 2026 14:45:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1792521906;
	 x=1792608306; bh=4dEKJiz7qNn7fsOJLiI2+hUQgs9ULSFP/CeGMQxc8t8=; b=
	ikppvGeZ+AxvlH2tqrDDxw+bakFVQvLMt5hGwd6WPjR7peAs1iNOytvIyGVoJ1kv
	M0dQNIPYkcegH4sIXFZ9h1G92skhmTrLhyAE0ierFJmNX0Ok6aGQsW+dh0Ni1bIM
	Av//0wVex86fiZ/Frfapn5tYyiqTLBQj/o3Q7kqwpI1xYnqbFW/CB4e3JYI3VVMA
	McRIxEzVBcjKr7YTAnyUC88VQqIpvgcAiwir0c4+oKzw0pF4X8/6koCsCyRMUnpw
	m8h84SFncypXLSBIcNhhmVY5VrXdl2KALU83j1M5hLbx9hL3V6l/yT2uhwBcYCiW
	wdhwTcSMOlU4IYZkiD1EXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792521906; x=
	1792608306; bh=4dEKJiz7qNn7fsOJLiI2+hUQgs9ULSFP/CeGMQxc8t8=; b=F
	+rvf0FSxTNO5qJsdskRSehaHl8iUgc74wiXg+qppG69Sx/rHKWlsUv9SzZEFp/kh
	+ijK2pdcnkloHbz8MjnOGMr2Pfye+a71v1NBmAQhMWYm8dFH2w30HyEQvTDMMNm9
	triczu79MccZP/fsPW4tTo0O5UnD7WW+GNOPoDo8mUHPKc5gp3GrlLfzlmlIKlor
	Z6iaZlFeeG1KISMoqAvxg+3mhe/Zm/5BmlFCsG7pDRx6LGQ4tsNwlzVln3CYrR9A
	1pH88KWH/d1wJ3EhwQYuhzKogLEsUwXFG1PQvvm2uT/5Mk0cAUqwrVM7ppeNDr5f
	eO9oaKaO7hDx33UuJj8bg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=sign d=fastmail.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792521906; d=fastmail.com;
	mf=PGtyaXN0b2ZmZXJoYXVnc2Jha2tAZmFzdG1haWwuY29tPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:UdPQ6PsxGcNO2aCGmU40DW4PBBH4zwlEPUVeHioW2jr7Gyi
	k8HWllMwogEaU8RWeipWU0ZzutcjIpp/KknJvly+Jt34vr7fsNVPG2G6hXYrwdYs
	TLffQIpEzazRgR7zFuf8uthgtkUxT0D6xPpPl2dMnDBjEZOZlkQ32DaSSl0EsNcH
	gXXG9PvOA5cwGv/GCEWupNV79YY5mO28NmPY9ygkJFoXukcLgPWwPcS+it7yoRRc
	0aBe/zMk5/WrHYi019HeE79JtZY9376ngC6+uu0bbkJpoyXqPYbTB3pkX6yIopwl
	bbXNjnqa4WD9CiNJ8fpmQbwg9TU/8r7jDlbWhFw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-08; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:eiGEWz1IZDeLE0+s45IETC6sl+0s+pO8Ueb5Tt3fzfI=:+qsCSwPYDsXm85Bi/Rgzp/9GtjzQpGZpb5B+fpP28Fk=;
X-ME-Sender: <xms:rrbXas2F96ghFKhEELIxms2jjdTNoG40dj_jmgMy1Og6xzHqlNZBbFE>
    <xme:rrbXah76JE5i37_bhdHMcm1zvUsSUJjlUA7ld7sl4FVnWPb2Xb_ORCusUAjwjNHQV
    9lTH9I_jKdt-u8wIa_R39NTKOYsBruESVDFzQpulsNf4UdBvi5yxp88>
X-ME-Proxy-Cause: dmFkZTET/xFmh/bjKM9xko8pFox5FcMBGV5bKPq7a+RPnkEb1FWGmrRbCdnu0YNaSxPjjy
    kbJSuwYf4WBAmJkb6IftDSNX800lGyw5LER4xxL4+TFSPSbom8LuPo+uitkMa0yjpuDmbp
    YaghWnaSEwTwYLQhKwtJf4ZaicBtqiaJHqN6SD9SZ+5k0ztrI/vUQJM+guyM0aePW2sw1l
    /7IsjZlSGr/0i+68ye/u4VH8w5ODz2YJYPOvNLHiGCi5NGnK2FKw6bmZC48vSErMHqnx87
    7w4I7GXbwPRvPcCwbxOzK7YkGyX2/rPr91Nxg5wc0fDDrQgU9ebR0SDjT7Co9SUTykLpA5
    yb4J5XjhuOV0l4G2DhXu83BqOKrLE08qZQjFQmOwOru0mQYTgaYbhv6vRKhMavhrbcYL9f
    s0DsYrIc4Nh8y8PznhLW8wnhVmLTRhwWa2OMMTg7+eJlS8KjhFhi4cw63uJF4KOLBMSTw+
    ItFXoG1QB6C4ciIdhXhHgydzh8ix52GdMfEcPRQOxlzIT+dA5e/liqsGXIhSTEZo+/ES3o
    /SpS/MIZ3Co/pizyD6haFIrd+ssEFpwVxv8JXwb2+GL2ACZ8M2PM7DqZnsIalJMoioZvX/
    GKonlmynZjDfW1ajTrnxuhRMV/2VcVExJYOdJ5pDKddRa/wySqB4vafaP8HQ
X-ME-Proxy: <xmx:sLbXapXeSvt4Lmzanc6sD9JCi7YGySw0LlISe3gzImfiD2o5TkIKeA>
    <xmx:sLbXakjCZjk-Am_65Ma2gwNTIbgOZRGaRUbxe77vfadDvlOOSfgWKQ>
    <xmx:sLbXakbftVtkqAfEDPGY9N3Cb_WyiTVhxZX57AI5mWwEvM38tuIZjg>
    <xmx:sLbXahr5XvquA92K7NIZcA7DTmKsjy31aBcNnhxeP6hmakdmat7nqA>
    <xmx:srbXanZgyoY2NI3my3Y07wCHIJtb6olFmvwI0Y3dlgyonLlAdTD4Tg59>
Feedback-ID: i8b11424c:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 9926222C00A4; Tue, 20 Oct 2026 14:45:02 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Tue, 20 Oct 2026 20:44:41 +0200
From: "Kristoffer Haugsbakk" <kristofferhaugsbakk@fastmail.com>
To: "Steven Rostedt" <rostedt@goodmis.org>, git@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 "Jonas Rebmann" <kernel@schlaraffenlan.de>,
 "Junio C Hamano" <gitster@pobox.com>,
 =?UTF-8?Q?Ricardo_B=2E_Marli=C3=A8re_=28SUSE=29?= <ricardo@marliere.net>
Message-Id: <095638e2-3e01-4217-8f08-3f9cb7fe8a07@app.fastmail.com>
In-Reply-To: <20261020141011.0015d172@gandalf.local.home>
References: <20261020141011.0015d172@gandalf.local.home>
Subject: Re: FYI, git output messages are being used by other tooling
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Oct 20, 2026, at 20:10, Steven Rostedt wrote:
> Hi,
>
> I just want to let you folks know that ktest.pl (tools/testing/ktest/ in
> the Linux kernel repository) parses the output of git to display the first
> bad commit found in an automated git bisect.
>
> The output was recently updated via: 0c0f93e7fa64 ("bisect: print bisect
> terms in single quotes") which made ktest.pl fail to find the bad commit.
>
> The change is being addressed:
>
>   
> https://lore.kernel.org/all/20261009-ktest-git-bisect-v1-1-1d1428f6cbf4@marliere.net/
>
> But I figured it would be good for you to know about this dependency.

There were recent threads about how to
query for the first bad commit.

https://lore.kernel.org/git/asAbOSQ4BkuCTPY5@debian/

I had a recent script that I put on hold and didn't
finish. But it involved using exit codes and querying
for things like ref state. And maybe using
git rev-list --bisect.

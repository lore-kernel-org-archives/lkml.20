Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEF250B417
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058819; cv=none; b=hVZarbrOUWYm2pQprpZwQUDYWMQSkfuOjNL7A7vxFa3hmhTgwJrEmAvdoYaEpyhmG127U1Ss12ag1QZJ8utf9swXA77uYGXT2LxTMcSIx/B7sW2INXmtEYDaS8f6oyJyD5ouO+D3cHd1evyaxS81bQh5aTJmog1x+k5ZoB+pdOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058819; c=relaxed/simple;
	bh=+fR0ZbzGgBBtyDW1FmelvhNzuV28OiZnZPEUZH6twI8=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=IIiXDshwV8efMnkKfZcQaGx9035Wc1fi9seyj9Erx7HfNTzGRpn7Sgpoe8jT8kKgEcmlJ0aaF6EyES+xrzCFkGXc/JItqYEwJ+cQ51JxbN1CS0mOi9QYfmAEPWq4of1DNm9odtUvPU6EKCqwdVUsdJqQIDbOMMNVGfRRQL0SIck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=KB3wo2Jo; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=m1VlaiTS; arc=none smtp.client-ip=202.12.124.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="KB3wo2Jo";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="m1VlaiTS"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 9BA507A00EA
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 06:06:56 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 15 Oct 2026 06:06:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1792058811;
	 x=1792145211; bh=k3bAN1K7IsDewyl4QIqTA/MPPVYd0C60WVWvSS6HY+s=; b=
	KB3wo2JoOuDtpD6FV3b25qBoe0/nGtxMc/28QsHrXnkHUutDHkRmlrcQRihkLXzO
	e1DpS2afTPgpq1wjlbOIxW/YrcFyeKkZw/Dnk6zX2UzHJqkR5SCen0R1kACQ/os/
	34iV60cuMNLm/BXStbW/A8aDwFu2QHdmqjcQWiC4VXuTY04G/tXoQXjd9WgPYQ/r
	q0l7D9IeFox4ULgt3tKtmx1EVBhVtOa6hwLTM0HXPeI2exsab0MCsEjmkaeo6Ykd
	9a2QyUHHKIACb/Zu4+oBaGJz3sEJTvDZcAk1uQWOIX0Y+T4evyrGK/60GXPYACfi
	2ORhvV+86BqJLsZ275ITUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1792058811; x=
	1792145211; bh=k3bAN1K7IsDewyl4QIqTA/MPPVYd0C60WVWvSS6HY+s=; b=m
	1VlaiTSqJ/5jfM/e2CqRXR6LPrON4JIk5vjl/wsXQj17OvG5+a0mUl1ADXJCMk8M
	Bsy9fWMRHLw6zZTqD8qPBua041UUQgOkm49XbgT4EpWl9wPqOBuSuCbMgXU0SlAT
	BMWqSK3Tl4xkWsUYaC1YUaC0ZAnWhYy+zeRfpgyQctnnmbifXar2/dJLixFNxK8y
	s2q/ARuW5uAmxpvR57ekhQ+wMm6npbSIiE3wwVMbTJYaW8ciLfaPUmiQGCqtJXaw
	8zKkse+ns0wN1k6bIls/AW35AKHbCdv67AAAyURdVGT5kpjQPu9bCXnKTQ0EHIjL
	7bkf06zwrsNSuwdGPAmEg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792058811; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:ET6ZhNdDS4Jqce1WWCm03D6w/jisMwM81ejcMUtXkIt4U3h
	YTUiSd7AAtSWATt02tgo5Jub9gl4pXZIb5JHymTAELa3kl83CzzsUpsW6MgVoXjh
	4cPibP0qvAUvvdbAYSxFGvqcWKvyQ/RMvSQ7da0hox4BmPqlUDJoWFyMnCXzkVwN
	P3mHV+r/qLTfaMeiY3WO2S+mqcDWr67rx9oMmsPKdRfhMWrLEwofiYcfT9kdJwn4
	2k4gMTaj5nEdPDmDcmsHlE1fYSq52jQJoWV3Fl6K0hXtg2p/RDkzylYmWZrAbms5
	BqHodQ77VbWovJHtt5YQiSheN+DAB34YDiVOYEg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:nA2K+yhtgPYlOovE/LlZdkAM7ht1S4LCl9IfhDW9GNI=:+fR0ZbzGgBBtyDW1FmelvhNzuV28OiZnZPEUZH6twI8=;
X-ME-Sender: <xms:uKXQag8wQowtjr8ooc87L-NLI0262fUDVWefYLaqSCCrrx5gM3zu1g>
    <xme:uKXQajjEvlqGetYkxX49epGwOTBGx0a3juUKwc9sflxewBdCFIzv4k5tjZeqhh2JG
    mlQh36SYoDM8TXArAjM6wAhz9ddqhwGnZYrLyAp50fQ2ExF_6t-jWA>
X-ME-Proxy-Cause: dmFkZTF2yAXpWN90zCVz3ihDvHA8S8c661e3XHP95EHkBhbsO8yHdl5wASUyJfCJu5AuYH
    tiGE/zFNrs+mhxG6IDJtPkC3VPS9znLTIkR7pmbhZVQuXx5FVsdTT86FyxBIXic4J2kAVV
    Ht9EIqTL2GcwAMhke9NynXeWC11g8lnSSsj6bchl+a/mzjy6sg7U/yXLQ2JtKlQKOBDR7i
    0/MID64vte8IGI6KUV86EgUXZ08D2Fm6oB80TkQU/TPR+coOSTxKLkqouD1ihdnZokjrbF
    OQRKmP0lVY1T8uLkZw6G78xZLsCwsmDkM+SQRONmK+Evqa3TCvuORLX8eXIoaNEhRZWQf9
    bg0HSEqmJ8aK9d+K8FjPajW37Gh0R3N6yKFmeXWgDIjunCI8y62ABR71zVC74jKO5syyUC
    oZereyttvvnEROnPAkPfA3bgQlJOGPvefQgfv82UI9CbInU0tQDNFyUuLgdfg/xJ3a53MQ
    UEaa7c4fWaPKmlNe9F1xAsKcmHUsUVkOMZobkVnklher/RcoNMOhZQZk+C1GpMnm5MJ7qU
    Xkq//yL2AifJOMNSqzkYfr/+ZahhnGGG2Oy1pvIYuO+VbQ8as74wCW+KQENS3hxTSzcdaZ
    DX8wbYpnocBC1JXrUyjAM973tDqoKQ/CE6q2TRgBQTcuP6Vkt4IxG8lXZVIA
X-ME-Proxy: <xmx:uqXQats4Kr17dJJtlunkkvwW-6FoRCyD4lS5BG20lShQEa3-2dyBnw>
    <xmx:uqXQapDXpgCK-ZMjig3lrw-vIVjy93UFHEk9eNLLJgEJvoT-bHRsbA>
    <xmx:uqXQakb9kkw0d5PYURNyJk-mqmLsp9uOrSwIE8zZFcWRSeZUnRjmag>
    <xmx:uqXQakVwN-gIAWDdiyO5D9b71vzIjlRyIkBhTZ2WlNqe2hNsstTTDQ>
    <xmx:u6XQapoDKTNfw1Jx0k9R3jy6mF5ABBBUa6djLEKyT3kasuq6zb0HHALs>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id D500B32A008F; Thu, 15 Oct 2026 06:06:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AQIkDqPSEdso
Date: Thu, 15 Oct 2026 12:06:28 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Sakari Ailus" <sakari.ailus@linux.intel.com>
Cc: "Arnd Bergmann" <arnd@kernel.org>,
 "Cosmin Tanislav" <cosmin.tanislav@analog.com>,
 "Mauro Carvalho Chehab" <mchehab@kernel.org>,
 "Hans Verkuil" <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Ceclan Dumitru" <dumitru.ceclan@analog.com>
Message-Id: <901b5203-7095-4c8f-8644-bef6847a8bf7@app.fastmail.com>
In-Reply-To: <atCfd-drVomrTS5X@kekkonen.localdomain>
References: <20261014103201.859465-1-arnd@kernel.org>
 <as9okp5GgBgc5Hlp@kekkonen.localdomain>
 <5b26153a-768a-4b33-bda3-19d3dea88634@app.fastmail.com>
 <atCfd-drVomrTS5X@kekkonen.localdomain>
Subject: Re: [PATCH] media: i2c: maxim-serdes: reduce max_des_update_streams() stack
 usage
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Oct 15, 2026, at 11:40, Sakari Ailus wrote:
> On Thu, Oct 15, 2026 at 08:45:26AM +0200, Arnd Bergmann wrote:
>> On Wed, Oct 14, 2026, at 13:33, Sakari Ailus wrote:
>> > On Wed, Oct 14, 2026 at 12:31:33PM +0200, Arnd Bergmann wrote:
>> Right. I see there are more allocations in max_des_update_pipe_remaps(),
>> and max_des_update_pipe_vc_remaps() called through max_des_update_links()
>> that could fail as well, and may have the additional problem of
>> leaking allocations every time a stream is enabled and disabled.
>> 
>> Can you tell if those should be fixed as well?
>
> There seem to be devm_*alloc*() functions being used but that doesn't look
> like a memory leak -- there's devm_kfree() use as well for the same
> pointers.

I see. Yes, that is a bit unusual but not a bug.

Seeing that the max_serdes_vc_remap array is only eight bytes long, the
devm_kzalloc() does seem like a very heavyweight operation here, that one
can just go on the stack and into struct max_des_pipe in place of
the pointer ;-)

>> Are ->enable_streams() and ->disable_streams() always serialized
>> or can they be called concurrently on the same subdev? If there
>> is only one of them at a time, the allocation could just be
>> done ahead of time in max_des_allocate().
>
> Access to sub-device state which these ops operate on is serialised using
> the sub-device state mutex i.e. these aren't called concurrently (on the
> same sub-device).
>
> Also cc Dumitru.

Ok, so maybe the easiest way would be to just put everything into 
max_des_priv, including all the currently dynamically allocated
arrays. Since all the maximum sizes are 4 or 8 in the driver
and most of the structures are short, using fixed-length arrays
will make it use less memory than the minimum of two cache lines
per devres object.

      Arnd

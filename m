Received: from mail-oo2-f41.google.com (mail-oo2-f41.google.com [74.125.231.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBDA41D23A
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 18:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790273367; cv=pass; b=p0oA0p1kn6kP1PsblR7sRcIRxZrPz/m8+UbdvjIZId5asbHchvhb7GbqaTF/TSItcvOSGX0A2ciHwR1+FtgRVI6eqfr2L4/lrzXPckMAT+4a45wdR6eMaFW26uInzEmgYOEHWYThyluyaQCE50YyY+i2ZYJDVHBgLd1GOvrPeJ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790273367; c=relaxed/simple;
	bh=2EkFOHbtczJ25xIy9v+cbiIrZHbSfV+/ZFifSdlSvm0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Kue+AnzZLFC5jpAAsDMF5RSxLbMBRk+2j9RxpM/oJJTS4J/XnWLeoOyH46bv9XeLGaMMQkOXGO4rq+2rAQOxG/xFN+C6nIF3T4pfvDnqarPK46m65K7Md4iu80sDg3VWv0KSPcGTrVRStrg6jUt5vBVqcy1tWx4z7pIksc1zB6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NcFtfn/+; arc=pass smtp.client-ip=74.125.231.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NcFtfn/+"
Received: by mail-oo2-f41.google.com with SMTP id 006d021491bc7-6b1ae6b200fso107297eaf.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:09:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790273364; cv=none;
        d=google.com; s=arc-20260327;
        b=NdQYv16/p/ectdaCnmVQI9wRcT9vOq3lQ7kTyqxXQHRVHawWre+EpS07dEGahes5Es
         FdIOK2PrewwAFEQCfmuPZCjx2A6yeOSfs7ZtLV9UF4UIA/lWbmTqIHxpt8rEyoBdeEpH
         II1FoT+hEnHOVg49uKAWrt7YQhizTwO/eyzm0j9TWiRfryEcc910y5qvStxFTfok8TS/
         bnAM1mNF3Ze7nIrjVcmgXisfQpR4y+EdipCPpUj6vojXJjshaI7+sHClRWvhe/fDbU4b
         VnP7RRZpn/kROgk+nYuOu5Q6OykhCJb9WNmsur9fJJoxVBCpu9P3MNaTdxFC9zovg2bW
         oDBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=2EkFOHbtczJ25xIy9v+cbiIrZHbSfV+/ZFifSdlSvm0=;
        fh=SXNTMMtrT6gTomPePdpCgED9IeYhn5xbQ6QJM/gMXUI=;
        b=Q9AW9iniXgPv7Ei4E8pTycIE21kDTM5Xz5oRpD0aYDMcHqz6PwK70kydpNp9ruRWhm
         TnQdnRmLbLu7eZBQyv2OenFvtcPkEj6wehTmXzRR8eiaE24cgzqj9sULCpfmUIZ0L+CC
         SqJxL/7+unTN+cdys1HooxlYRudfhYAWq8WDs1Lm2QM1ndVs+ppJgiTF5FkJGHyuPwlD
         +B90WFH0vDdG/eGQ1iOXJXDuEwcujS/3D5FQkzFYQOf+2FZOHlVdbkNDRJyrwKZfWqD/
         WJQxoYNZ/rZh/N8QuiXTMHfBVgHrBFkNrfHjC3AmTrd0k8Cfem7RAlYvDJKtFg5l3Zl7
         gWlA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790273364; x=1790878164; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2EkFOHbtczJ25xIy9v+cbiIrZHbSfV+/ZFifSdlSvm0=;
        b=NcFtfn/+Jxow3K8bNArOLLr2cZfJRbIwMl5c3X9CCd0ZoZKr8ewqPuaGDrWd3KYxy8
         cmEw+McSe0AJDtPWEgwk8QPc0kKa8vu/cFc5H++CJQCvQ+5g7DtFieAYF95XVbkkIbqB
         9gL7vEhSU70muCzUk1G/JbXMhZFjwVQ0iHAMjPdTVUieZ17K27timh4xLI7NTIWAJi3V
         z7S67DCYz3f3jSQn1aGKHiexsUzI765s+SchzKD7rD1I/r6PoGHGc98MFfaEQaylU9Uj
         Hh2D8gtoGqjR0m435lhP21R2aaCqCxEKLd193EhK4pK6ChAtAub2cTqLWUE/qR2Vwt+9
         Nd/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790273364; x=1790878164;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2EkFOHbtczJ25xIy9v+cbiIrZHbSfV+/ZFifSdlSvm0=;
        b=fXCe7WMVbGyobL1kAmsn/hSAKHKnNiCpjLviMFkVy68tp+yyHgZu0NBr/0xzzMXqoh
         sd+5RZBKkK+Si9UI2rcYMTUsgsE+ehbOv9JE0wdt0QYOYbCKAFRHpmN1c/VrWcjAC5V4
         WAsKX7tX+WPqNO2HapfUO+bMCrHFxso1sBiKhIk7j/Uonzu4OWSlc8kECR0Kw2nBLNhM
         vdBJQ8lwUEH2qEu4PmtD8HgJkof7AVsepfs2CYBth/bZqR0PxWbNaOw4yMaIl4mgBQWC
         HSx6hXflL1Pq19ZxqMrpYv705YUPqP2uZszto8UeBW5N1UASKz/cgm+p3R0Ns1cRNLSc
         YMog==
X-Forwarded-Encrypted: i=1; AKwUvBwj12OBDqKOREU+qJA79bvIQG28IX2UKinD0cQemD6H2nA86F1Gie1J3ZT22jsjTHpDYbk9mzj0xuC3P1c=@vger.kernel.org
X-Gm-Message-State: AFuF++mBtLIiftLNnCReR+C4/++HpHg52hf0OKQbG8yzu2NKZK6nQHpo
	oCbveWDaeFsndo6NjU3qY6CePGMqXL6fd9DfsFfFhqMpIUT85b3xV4g1RSn9litMzrgcDAiIlxi
	TnByDs7H9D1Ct3ffJd2875vafRXQL9yY=
X-Gm-Gg: AYBFou0SRYbUA+LUowI3cEnRggJtDz9UJn9h0xIjz7Jm8wy5FDU2NtQT+y2JduMVHRe
	0XuVI7tHt/6OFv1Ryq8C/LO4q/FEskngqZ1cgDrkScKrbSRkNzu9pC9oGDzZfms/hr5Lk1npqs5
	sMif7NUft5g8/wxYeG5XPOo7+p3kFxKcRFNupp8VSglnPIIDZRv+n5o9kU9w+1EV9qXPL/60NYq
	mK6d8fDb/0nmo14E2yh6iA6p0ptLM/LGVURHFjLQsV+ndD4bILHcFlSOd+NYvnqFgJY0ZQhVrAY
	I10IMDPFu5GS7CwMk9QQ4SLFZWiA0ZdT6gS1jighbQbOSB1BgoAUu+UJElSJu4AjgAirYgWgSOK
	W8kkejNLPHPO4B9KO03bNGw==
X-Received: by 2002:a4a:e911:0:b0:6cd:3fcc:96cd with SMTP id
 006d021491bc7-6d440727618mr2876058eaf.75.1790273364474; Thu, 24 Sep 2026
 11:09:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: David Kahurani <k.kahurani@gmail.com>
Date: Thu, 24 Sep 2026 21:10:17 +0300
X-Gm-Features: AclHuK-UFtDLQMsV18Y4wTPBabatIQ__XOC0_s6nwPVOifgFG4IFCTOuHeX7SZM
Message-ID: <CAAZOf26tZiTZLsh1717muAospPb95HHAcxqLq0_qmL850+-oPg@mail.gmail.com>
Subject: Other user-space threading issues
To: io-uring <io-uring@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, tglx@kernel.org
Content-Type: text/plain; charset="UTF-8"

Just replying to this :
https://lwn.net/ml/all/20260911154148.644489-2-axboe@kernel.dk/ but
because this thread is locked on lwn.net I will do it right here :-)

...............


I know you do ask for this and this not part of the review to the
patchset it responds to. However, I think this is important enough to
append here. At least for FYI purposes.

io-uring uses a file model and a file model, from the looks of it( not
something I have a lot of experience with), seems very leniet in it's
security model especially from a user-space perspective. For instance,
there's no way to restrict a process from reading data that belongs to
another process, if the socket is shared. This is obviously something
that is probably common across all files. In other words, a shared
file could possibly be generally said to be, insecure. I don't know
for sure.

io-uring has file_table construct and a buffer concept. These are
additional concepts to a filesystem file's private_data. At the same
time, these objects and members of io-uring will get shared when the
file is shared across processes.

The above obviously introduces additional security and possibly
*memory* concerns. If one process for instance setups up an io-uring
and add somes files into the file table, then the ring gets shared
with another process, then and now this second process has access to
the contents of the file_table and possibly files that the first
process didn't share with it. In fact, the second process can now even
close files that were opened the by first process and then saved to
the file_table. Just essentially putting, the second process now
essentially has total control over files that belong to the first
process. This and vice versa.

The same thing applies to buffers. In fact, just going with the
scenario above, whereby we have a first process and a second process
and the first process configures buffers then shares the ring. The
second process can for instance, add buffers to the head of the buffer
list and each time the first process grabs a buffer from the
buffer_list then this buffer belongs to the second process; the kernel
doesn't know this and proceeds to write to the buffer and eventually
the second process can now watch what is happening in the first
process and the first process is denied access to it's data,
effectively. This could be a bug even in a normal / ordinary consumer
operations where there's no malicious users at all.

At the very least, the above are at least issues that are mostly
fairly inconsequential and probably ill described but, still, I am yet
to come across io-uring code that works around these problem(s).

Anyways

..................

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=166.70.13.231
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792774003;
	b=LmyvJJd8BTB+nybkXYw6B0ELfP1VEV2Sb+fL2jtfmMK9z5MnqUGRObN3TOsw6/8X4yMo
	 VbqPsYoVWZbD56BTuFEnsE3UahyCzAR1LMF77fClbUw+JqWqV8Z9LwWWNOniOvY8S/1V9
	 aggK+u00wKYtEmYZIYqixK97tkU03B4Cf8W6GpYaF+bS3ookn0TJqCEGNJejSjJzC0CaN
	 33IbwsnKz75K0Nk3gRwGbtKNA7r5iMIW3YhMi/MR4Zim1gmFDP/3HuO21RGgHjTll8+8m
	 BdUF2CQzWBMgRyXQr0JeYzBuXVnt9a+GB/+4WgcDNe8viAQC4wpWAr0bs7YZIaSU1VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792774003;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:In-Reply-To:
	 References:Date:Message-ID:User-Agent:MIME-Version:Content-Type:
	 X-XM-SPF:X-XM-AID:X-Spam-Checker-Version:X-Spam-Level:X-Spam-Status:
	 X-Spam-Report:X-Spam-DCC:X-Spam-Combo:X-Spam-Relay-Country:
	 X-Spam-Timing:Subject:X-SA-Exim-Connect-IP:X-SA-Exim-Rcpt-To:
	 X-SA-Exim-Mail-From:X-SA-Exim-Scanned;
	bh=82bTzH8eVIE2tgVWltT+4ou8BnctubUdQH4ZaS6hVI8=;
	b=zmAJUhmvnbyTrR7R+4qLWgWl7KEUGJpwu8MYkIh3WW8boWcYnx9sd8RU3wt2ZXoAiiED
	 5qHLtVTcE0DKX1xt7gEZTgByKfGS08A6ZqIF6GEPmhuEH6p4AUcXUmsBMeE4WvR0MRmM1
	 M98Kd2CDzkoLME+C5OyobD+beyR2kzK0jBK1S3CjYeAauAMZkQhAcVwF+LWF0fLtB2rhT
	 VHqo2vO517aJ2ygIc2JV1/a8Fb1N02qQXLBKk5NvqDmPift8dnyWqHXUlY90Fhc8kNo2t
	 uvE8fQwJdA/spKZMxLdwMDvrr4xel6rT0YIene1EX68GJX/u/33KDaD8/2WFMpJHSwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=xmission.com;
	spf=pass smtp.mailfrom=xmission.com;
	dkim=pass header.d=xmission.com header.i=@xmission.com header.a=rsa-sha256 header.s=xmission header.b="aH/bFaCp";
	arc=none smtp.remote-ip=166.70.13.231
Received: from out01.mta.xmission.com (out01.mta.xmission.com [166.70.13.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB7F606A320
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:46:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FB7F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xmission.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xmission.com header.i=@xmission.com header.a=rsa-sha256 header.s=xmission header.b=aH/bFaCp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=simple/simple; d=xmission.com;
	 s=xmission; h=Subject:Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=fUYZXTVsCaFN7hbxAWsgLILLo31/bL8keRKxFbBIhD4=; b=aH/bFaCpMArCSt7MPia9ANPUB/
	mQdfNExPcKJisj4G4DFqagZwQaN1CWs0UHHusitjwqT3jut0xX80LMnmGI3NrSpukCRSf1NmYdW98
	heYB0+ml0FXpDP9V6ncQE0vzXPKX/54GZ6Cs8hU6xHpbSMKRvbJFOu7gaeh4X1E+amYs=;
Received: from in02.mta.xmission.com ([166.70.13.52]:43742)
	by out01.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1xKIPd-00DZ4I-FA; Fri, 23 Oct 2026 10:46:37 -0600
Received: from ip72-198-196-98.om.om.cox.net ([72.198.196.98]:44738 helo=email.froward.int.ebiederm.org.xmission.com)
	by in02.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1xKIPc-00HC6e-Kj; Fri, 23 Oct 2026 10:46:37 -0600
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Avi Weiss <thnkslprpt@gmail.com>,  Christian Brauner
 <brauner@kernel.org>,  Andrew Morton <akpm@linux-foundation.org>,
  linux-kernel@vger.kernel.org
In-Reply-To: <ats7_mSMrLBAq0Np@redhat.com> (Oleg Nesterov's message of "Fri,
	23 Oct 2026 12:50:38 +0200")
References: <20261022061015.3737924-1-thnkslprpt@gmail.com>
	<ats7j0mb3VF6lIg4@redhat.com> <ats7_mSMrLBAq0Np@redhat.com>
Date: Fri, 23 Oct 2026 16:46:32 +0000
Message-ID: <87qzhgmkk7.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1xKIPc-00HC6e-Kj;;;mid=<87qzhgmkk7.fsf@email.froward.int.ebiederm.org>;;;hst=in02.mta.xmission.com;;;ip=72.198.196.98;;;frm=ebiederm@xmission.com;;;sPfnum=0;;;sPf=pass
X-XM-AID: U2FsdGVkX1+dR77xV5flOxQgDF48qQKcbD/Kx8U+KYI=
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	*  0.1 BAYES_50 BODY: Bayes spam probability is 40 to 60%
	*      [score: 0.5001]
	*  0.7 XMSubLong Long Subject
	*  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
	* -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
	*      [sa07 1397; Body=1 Fuz1=1 Fuz2=1]
	*  0.0 T_TooManySym_03 6+ unique symbols in subject
	*  0.0 T_TooManySym_01 4+ unique symbols in subject
	*  0.0 T_TooManySym_02 5+ unique symbols in subject
X-Spam-DCC: XMission; sa07 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ;Oleg Nesterov <oleg@redhat.com>
X-Spam-Relay-Country: 
X-Spam-Timing: total 357 ms - load_scoreonly_sql: 0.04 (0.0%),
	signal_user_changed: 11 (3.1%), b_tie_ro: 10 (2.7%), parse: 0.71
	(0.2%), extract_message_metadata: 10 (2.8%), get_uri_detail_list: 1.15
	(0.3%), tests_pri_-2000: 10 (2.9%), tests_pri_-1000: 1.84 (0.5%),
	tests_pri_-950: 0.88 (0.2%), tests_pri_-900: 0.66 (0.2%),
	tests_pri_-90: 132 (37.1%), check_bayes: 130 (36.4%), b_tokenize: 4.6
	(1.3%), b_tok_get_all: 4.9 (1.4%), b_comp_prob: 2.1 (0.6%),
	b_tok_touch_all: 114 (31.8%), b_finish: 1.25 (0.3%), tests_pri_0: 174
	(48.8%), check_dkim_signature: 0.46 (0.1%), check_dkim_adsp: 2.5
	(0.7%), poll_dns_idle: 0.49 (0.1%), tests_pri_10: 1.97 (0.6%),
	tests_pri_500: 9 (2.7%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH] signal: cleanup the .si_signo checks in
 dequeue_synchronous_signal()
X-SA-Exim-Connect-IP: 166.70.13.52
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, akpm@linux-foundation.org, brauner@kernel.org, thnkslprpt@gmail.com, oleg@redhat.com
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-SA-Exim-Scanned: No (on out01.mta.xmission.com); SAEximRunCond expanded to false

Oleg Nesterov <oleg@redhat.com> writes:

> Christian,
>
> This is on top of Avi's
> [PATCH v2] signal: respect the blocked mask in dequeue_synchronous_signal()
>
> If you are going to update your tree and take V2 + my cleanup, I will not
> mind if you fold my patch into the fix from Avi.
>
> And! I just noticed the sashiko's review of Avi's patch:
> https://sashiko.dev/#/patchset/20261022061015.3737924-1-thnkslprpt%40gmail.com
>
> It noticed the problem with UB too. But, unlike me, it noticed another problem
> with the "still_pending" logic. The described scenario is not possible after my
> change, but we have the same problem with posix timers.
>
> This needs another change. I'll try to think a bit to avoid a "brute
> force" fix.

One thing we can reasonably do is to disallow sending signals that
are "from the kernel" to ourselves if the signal number is a real time
signal.

Since the kernel won't generate any of those there is no need to restore
them, or test them.  So allowing them is unnecessary and leads to bugs
in the code.

I don't know how useful that would be but it is an option.

Eric

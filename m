Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=166.70.13.233
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792772905;
	b=E1Iw7EgEkMQTbaLMLLkNIqLNkdnI2x+lwWOWsjiAfMUICrKRPXz24GRTs5Zw1b3OcFHD
	 0tvFJEbVUF7Yz6lKDLXIeXgZHetdxKUnGERLjBXusW56+nqVAyqNw0Tj7MeKiIak06iCp
	 hUJI3VxVPU0NrHdt2yahute2Pd0yAGcA8jMELs6jK471by7/pQOcTVOfpxRO0CwAGdLye
	 1LwAukgvgpXpYvFcHkVY+Yucm959aHHcv8rDr9D5rfDbY95fboDAzgAqslUTpQXEyYw36
	 AIX6rhlqXj0AhV7Mw3QXnxvI+lbb+N/Uz0fzCyvpzv8GUu/LYqyRE2W7HbA6y0K4GrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792772905;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:In-Reply-To:
	 References:Date:Message-ID:User-Agent:MIME-Version:Content-Type:
	 X-XM-SPF:X-XM-AID:X-Spam-Checker-Version:X-Spam-Level:X-Spam-Status:
	 X-Spam-Report:X-Spam-DCC:X-Spam-Combo:X-Spam-Relay-Country:
	 X-Spam-Timing:Subject:X-SA-Exim-Connect-IP:X-SA-Exim-Rcpt-To:
	 X-SA-Exim-Mail-From:X-SA-Exim-Scanned;
	bh=rMmFfJAtBkV6tYwVMY2ABpKfeChIFWqhPbYdrg9VT9c=;
	b=bEDeyWzF3clknxcMtJeAMOSFyC75zoqkmq3bnsTRkLltgxUVtjjJ9P2CSTehIZKqM7ot
	 dMGPG/wgXuMVrfh5xvFASnj3+uIJ4734M236HMYQZX/L7D3uWAuuEwqS6VwpA1biA59pm
	 AxY8ydyf76yITntcFpGGZYQmX/JWjpmCKOuwJBOX4WVHOUbTd8bHOSxP2tejOApcgi2Fz
	 9YTvR5MT790AEeO/sxM44VUd5U0jdGNuZoWxHe3S90m9pqMZiTg1ruBI6fuSsyCDhIoV2
	 bnqQGJ+1t276ePgqE7JX5TvlqzYNzyHH6oIFCyNaWm7eVNSb3QavUsTsBl709lqM+LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=xmission.com;
	spf=pass smtp.mailfrom=xmission.com;
	dkim=pass header.d=xmission.com header.i=@xmission.com header.a=rsa-sha256 header.s=xmission header.b="o/S3tiov";
	arc=none smtp.remote-ip=166.70.13.233
Received: from out03.mta.xmission.com (out03.mta.xmission.com [166.70.13.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13B5606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:28:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B13B5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xmission.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xmission.com header.i=@xmission.com header.a=rsa-sha256 header.s=xmission header.b=o/S3tiov
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=simple/simple; d=xmission.com;
	 s=xmission; h=Subject:Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=knH1e86fvkGKZZzxWE9WIOT9yRA/0JUqkXj35RYD+f8=; b=o/S3tiovLwd+S8reJo6T7RfoMh
	3P3uJx5fksihgLAUJw4hti2U5udIB2+t7cZ79dOnpMtrSFLdSo2uOt0/QpAMRNX7yLkvUTLfCUicJ
	rQLAyN2iK+HfUqeEllsgaHMATKMBGjf6RiVnbP7WppGqIeDSvUuojSOj7dyEhuC9YGVE=;
Received: from in02.mta.xmission.com ([166.70.13.52]:37510)
	by out03.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1xKI7z-000FhY-NY; Fri, 23 Oct 2026 10:28:23 -0600
Received: from ip72-198-196-98.om.om.cox.net ([72.198.196.98]:45622 helo=email.froward.int.ebiederm.org.xmission.com)
	by in02.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1xKI7y-00H9LE-P2; Fri, 23 Oct 2026 10:28:23 -0600
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Avi Weiss <thnkslprpt@gmail.com>,  Andrew Morton
 <akpm@linux-foundation.org>,  Christian Brauner <brauner@kernel.org>,
  linux-kernel@vger.kernel.org
In-Reply-To: <atswnpqj8VHJwqu9@redhat.com> (Oleg Nesterov's message of "Fri,
	23 Oct 2026 12:02:06 +0200")
References: <20261022061015.3737924-1-thnkslprpt@gmail.com>
	<atn6anj4NRKpT-qN@redhat.com>
	<878q3po5a1.fsf@email.froward.int.ebiederm.org>
	<atswnpqj8VHJwqu9@redhat.com>
Date: Fri, 23 Oct 2026 16:28:16 +0000
Message-ID: <8733twnzz3.fsf@email.froward.int.ebiederm.org>
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
X-XM-SPF: eid=1xKI7y-00H9LE-P2;;;mid=<8733twnzz3.fsf@email.froward.int.ebiederm.org>;;;hst=in02.mta.xmission.com;;;ip=72.198.196.98;;;frm=ebiederm@xmission.com;;;sPfnum=0;;;sPf=pass
X-XM-AID: U2FsdGVkX187X5zaqduZF3EVStlYAlO3ExoowrV3DC0=
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	*  0.1 BAYES_50 BODY: Bayes spam probability is 40 to 60%
	*      [score: 0.5004]
	*  0.7 XMSubLong Long Subject
	*  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
	* -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
	*      [sa05 1397; Body=1 Fuz1=1 Fuz2=1]
	*  0.0 T_TooManySym_02 5+ unique symbols in subject
	*  0.0 T_TooManySym_01 4+ unique symbols in subject
X-Spam-DCC: XMission; sa05 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ;Oleg Nesterov <oleg@redhat.com>
X-Spam-Relay-Country: 
X-Spam-Timing: total 476 ms - load_scoreonly_sql: 0.05 (0.0%),
	signal_user_changed: 11 (2.3%), b_tie_ro: 10 (2.0%), parse: 0.70
	(0.1%), extract_message_metadata: 2.5 (0.5%), get_uri_detail_list:
	0.74 (0.2%), tests_pri_-2000: 2.0 (0.4%), tests_pri_-1000: 1.91 (0.4%),
	 tests_pri_-950: 0.91 (0.2%), tests_pri_-900: 0.71 (0.1%),
	tests_pri_-90: 165 (34.6%), check_bayes: 161 (33.8%), b_tokenize: 4.7
	(1.0%), b_tok_get_all: 34 (7.1%), b_comp_prob: 4.2 (0.9%),
	b_tok_touch_all: 113 (23.7%), b_finish: 1.48 (0.3%), tests_pri_0: 270
	(56.7%), check_dkim_signature: 0.59 (0.1%), check_dkim_adsp: 39 (8.1%),
	 poll_dns_idle: 6 (1.3%), tests_pri_10: 2.9 (0.6%), tests_pri_500: 12
	(2.5%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH v2] signal: respect the blocked mask in
 dequeue_synchronous_signal()
X-SA-Exim-Connect-IP: 166.70.13.52
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, brauner@kernel.org, akpm@linux-foundation.org, thnkslprpt@gmail.com, oleg@redhat.com
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-SA-Exim-Scanned: No (on out03.mta.xmission.com); SAEximRunCond expanded to false

Oleg Nesterov <oleg@redhat.com> writes:

> On 10/22, Eric W. Biederman wrote:
>>
>> Oleg Nesterov <oleg@redhat.com> writes:
>>
>> > And afaics we have another problem. sys_rt_sigqueueinfo() allows to
>> > send a SI_FROMKERNEL RT signal to itself.
>>
>> I don't see where your proposed code is addressing this.
>
> Hmm. It doesn't even try. And yes, I know it is deliberate, I know that
> CRIU uses this feature.
>
>> > In this case sigmask(q->info.si_signo) leads to UB on 32-bit.
>>
>> I presume you are referring to a signal number that exceeds 32
>> being put into a 32bit mask.  That does seem worth fixing.
>
> Yes. That is all. I just tried to explain why this can happen.
> sys_rt_sigqueueinfo() is the reason. The kernel doesn't sent
> SI_FROMKERNEL signals with si_signo >= SIGRTMIN.

Oh I see.  I thought you were saying it was a bug that
sys_rt_sigqueue_info could send those signals, not that
it sending those signals would cause us problems.

Eric


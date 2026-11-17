Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.76.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925583;
	b=kZZzK7BzZ3Lg60lTfxbvLUHQOPJpsdNr/pqpTwsWAUda7dD9YeNJMgpvajpvI4p1Wpjz
	 urtCnY0mAl23g99bXXU1FuRTUEL7bEp6zRuTyKDIJQw8VRaldn4tmtt9EiUQc11gXKhsR
	 qsFGof8+JTlyhL/nnNqGrXNEiMiZN44GU6bXPKahUlfV2DrBxVmXWgBaS0hyDcyfLTfKu
	 OMmhUdH+wlVHUfjOW2rxdIeVNi5DSy9TfISdFpwAXK3BTTGmtTSw/gdWI1+BEdayY/aSI
	 d1LSnFIKkQSEzmyj/bcs3WPBMoAhEUGuvPvsXC1GzHRfbx+fESK3Gt5wF9ibNjdF60Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925583;
	h=DMARC-Filter:Received:X-ICL-RepId:Dkim-Signature:Received:From:To:Cc:
	 Subject:Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Info-Out:X-JNJ;
	bh=cFBQgsUKqn2SeEBgrCHrVNl21tMPPxSMfQjFRoHrS54=;
	b=mooX3YWqe5FYGMoI3DfYnbbn2MkhXOG9VspUgTECBZRPQJhdUoKGQc6xqnlqi4EFeSRl
	 LIEGBExhlb0Uc7vzftjcJ1Ljt4a+w/avd8IiO+U8qYF7NA9j70lkllwQP0ul2/BpgLv/q
	 sxkixdZa9OmNN3eFo28rDXDxIjasmf3rdYvt5qvjqMjQr+fixZbVfgtaww6t3fKsL4rw0
	 NkeEyaf4e6nBlwgyvjEzPyQLeo+qUf85q7j/kb2EiIH7+HgQCDOsgpLxbZLQ4UBdo7mp/
	 QsLBDclx2HtnektRfsK7cSz2PsFTC5wm1yFwwpZbMVFilmwV4VA2GFsCi0Re36K3SAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=icloud.com;
	spf=pass smtp.mailfrom=icloud.com;
	dkim=pass header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=DowSCbg7;
	arc=none smtp.remote-ip=57.103.76.161
Received: from outbound.st.icloud.com (st-2006g-snip4-11.eps.apple.com [57.103.76.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D021606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:26:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D021606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=icloud.com header.i=@icloud.com header.a=rsa-sha256 header.s=1a1hai header.b=DowSCbg7
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-5 (Postfix) with ESMTPS id 83D8D18000AF;
	Tue, 17 Nov 2026 14:26:19 +0000 (UTC)
X-ICL-RepId: 01a1e9e6-ccc9-71e4-98a9-760f2b0e292f
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1794925582; x=1826461582; bh=cFBQgsUKqn2SeEBgrCHrVNl21tMPPxSMfQjFRoHrS54=; h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version:x-icloud-hme; b=DowSCbg7YwoSsknR4EjggXyYYm02omUQrEl0OXPCqFHbWE55JH3cDwfIUUt8J+NsE64lMfuMsKxffuK/q2uAwbnAZQBhG1xb/iK5EX25+MC/1nbanytzcedOPrCtb2ULBNwwGdUqGr0foKvajRlhXIKwV6uDRXiStaVX6hEBzbroeu8qA7kVAP4kvpSAYON1xehJ+tXZdPvASAMaEpXpOWfBWgC7+htBa/f8jbb5FM/zW+URNJnAlighdoRfU5uBoI6MWB1oh/SzKWHjLICl5pV71q5NAcbWNX8V5K5c2lBkNmVZvuMGC4Jp/olqWATgjSL9lUUZP6wDsQO5zh3qcA==
Received: from omarchy.local (unknown [17.156.216.30])
	by p00-icloudmta-asmtp-us-east-1a-60-percent-5 (Postfix) with ESMTPSA id 621301800122;
	Tue, 17 Nov 2026 14:26:12 +0000 (UTC)
From: Muhammad Haris Awan <m.harisawan@icloud.com>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Kees Cook <kees@kernel.org>,
 Liam R. Howlett <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] fork: mark memcpy() in dup_mm() with data_race()
Date: Tue, 17 Nov 2026 19:26:08 +0500
Message-ID: <179492556819.269625.4305215206796797018@icloud.com>
In-Reply-To: <avxPvfV4NxKL58ZR@gremlin>
References: <179489519663.1444496.15875846661591982934@icloud.com>
 <0b565b9c-1462-4fed-8836-9a7d08e4b861@kernel.org>
 <f75945f7-82bc-4ff2-92ac-9ec057347a41@kernel.org> <avxPvfV4NxKL58ZR@gremlin>
Content-Type: text/plain; charset="utf-8"
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
X-Proofpoint-GUID: p8wqqG80lPu0mQwr9KgtBsMoa_EicKJf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1NyBTYWx0ZWRfXxui4LjhxlIV4
 DypV9iBKoe5+y/yVnE0sXJDeZm/WcuAApvJEj2MSL9X6i6mXYDN0QcTE427VRIxMaG5MevK98L+
 Op4kc4VboUyjgtdhv8pHVA8brD7VpSTHYvWiP6JQM/zvWbhqj3RYEiGkB599+/zZJC8agG3KnPp
 Uj6nBLE4AnKWBkVBQhI4drUw55ueCTDW7Ma3fQiFaD9L7UUJWwqsqb66MFD1ItEzZsoCtngcmVs
 /hNrKDSt5c/LUHu8ydkoKlHFM9+3A3ZE3GLMHIJGuIlGjpu5MFpQGGJ297sKgp/bHS5MoRjhft3
 80FPuvjpLETj1GL2vF1ngWPUaEGDoEAXgHPrtT24NtgHUey4Q9NCfdD6TrNWik=
X-Proofpoint-ORIG-GUID: p8wqqG80lPu0mQwr9KgtBsMoa_EicKJf
X-Authority-Info-Out: v=2.4 cv=ZMDaWH7b c=1 sm=1 tr=0 ts=6afc640d
 cx=c_apl:c_pps:t_out a=oyWFxbOnq+dmhQrAPgaJYA==:117
 a=oyWFxbOnq+dmhQrAPgaJYA==:17 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=x7bEGLp0ZPQA:10 a=2kFROKt5_e8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=cxNFcN4zLupSoemyiDcA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10
X-JNJ: AAAAAAABOQLEpfW9MVVoxxro1LkZWVzM4PxAUYPKMvIDCe/LliswltnyqBAinHwTCNR2oc
 9gVTpS92RTbdQ+h3sFHXgwKPFVx4uqmn9TdMdZdHcrfcYD7aCV75ln1eF02aXQvwNhSpfz
 qbDdn+J4UwyQ26Y/DkBtNRymeyy2eYlK9kM8qqBDD2z53qSLHwjPrOUq3ZX29w02Iha4Xm
 /HdnAhVa2t/MSMZRlfhDwcPXcb0BJZx5XzPtWmQFc650+oaYYWsHRUJuMuX+hxS5nAUqNh
 DS2KVPYsRLvFwDLFzSipOqZ0EOoS0i5BnoPv7JlUydseyJgxdj2GjeEUcLK+IfEVFwr/RT
 fARHhIrV1d4w7gevT+d7dsEABWIgVwxFiNl8M/YfSEtDiqfCOMdszXoI6G0PKMwj5VidPs
 cVpK4JpJmm8lH3HFaeM3FsXAystR+JgNvWd0n5m2zx7Fep1XpVfoXUMYMSdl7/Slwyz7ut
 0fyZYgFfWbonBu52MJ2oEmmbwfRYQxCkl8Z+NBnsvXcv9DqFU158+Mr66uvD/QdTnKIf69
 qAyxCqzoxoY7deB0jC1d8CjN5H8SNPi41EqFFwhHTsTJugGYY3d8MTTrMqoKdKisqNABnw
 T0Uze3OtGdHBKlcHtIbUVy+zF+W0M9vkpJ47deMqaK5sfBAvwLzYer+8xbbIuLwpL4c0Up
 F4dVDxOx5+giYdkXiRzSZZvuLVp+m61LjhecQ8Ppp5OA8kFcuLXZRXSbjhxi78gnHzLYlc
 FPjF48DBA2dHiclucWwoOmk8VE01bfDJSXDtSBvk1uZDsqkSsmP8AeKxRLo1L8fQnwpWFn
 TmXf5LdQ8BSOMMzs1oM6hCx0qgsnBPARbdtCexGvpzwPgBqmJU7SaGIm/jVewn+rdk8PtM
 aIPtjywD6Q3IOlozmYp3sbZ6b2g+c3gx/7/IXMjEKP/LXkRVyvAzJqzSwo8rH/MFfZ5sTJ
 rKDMke70FROWm3tt1k/6V0zpzYUoKEk/KzjQP+oLxj5e/+7asmSG0DQoPYBmtFzngrfQ+N
 q3vF/RHaIYeZd4k9bBINfeTVp5tXss9+FldOX7a9FKPWcoXdbh5ner88i9bfUsNAn+3FQT
 c2Nn7+pVC2FC66TuNXLXfm4pT8iccg9V+2MsCKHqaERD6XEOeBz+n8jgbkssYz0go/IyZI
 9DgmY+AUVt2mXwX6lmGKqRqYJoyqDE2S24e4XzH/HZi27a+RcCqYyySbzhi8G5IWqiAsx/
 cvXz/+u5cOBb35FLakU7cB2EXLTPORme/GGFOhe3svu7sGAltdHtu62+fYC0Fbxa4IUQlO
 ZKFoBElrFAW5Hiaiud/ZGMTzpEds40IUkHXewwnOqdbwD8KfrE6zv1wP9eYrGGI7XEAw1C
 vVZobikT/Zv8rpC6vLOPtWX28uVne+b3uZRUzQs/w1wXOhpoiPHnaWeXX0Z+vg==

I accept the technical feedback. Silencing KCSAN on the whole dup_mm()
memcpy is too broad so I'm dropping this patch.

To be honest, I used AI to help draft the messages and I should have
mentioned that. I picked up this open syzbot bug because I genuinely
want to contribute to Linux and open source, and I chose a rare edge
case because I thought no one else would pick it.

A technical NACK is totally fine and I appreciate the review, but calling
a new contributor's attempt "slop" isn't really needed to say the fix
isn't good.

With respect,
Haris

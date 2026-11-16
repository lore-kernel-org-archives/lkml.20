Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794858728;
	b=TiBr19g+C1wNVSyhCUBOjN4c5Zhvw0iSKeZ5GxfXIcHfm5d+uKlVK4JH8qmonAb9qSdJ
	 6MSMTJ23/PsVWtxitI/D0VO+WdpvziUON7ZV0o5s83lk85GrtLUX9Wg/IoDyWfa6SGsU1
	 xu+zM4NUdR0/sVG4dInoDvLblYwAzStWjlSDAWnU1yiqGCd3U1JxF+WXsDH2bKZeyheqL
	 BGxVbcPhShZc85PpcJF8xEddx/WBquM4Yl+7ssyPtpQaYx7AbvyxkYC/aYb/X8DNw/GQc
	 mTwcpFf9EkRiXlrQyMBiLKhtB6upNgeUndzH0AJMAHzvx/LbZimx9WQc2mwba9XmX+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794858728;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=XfsUca4ieNzhhEOE8BDvNJYRYK3NXV9a1RuC/4qrNNU=;
	b=hvGXTGxMlF0nZRtfagrNjofmu6U3nVT2KIFc0iLcvqzDSE82OvRbR1NWL2VpZWxqiIgg
	 dlwCDOlml1kv0tfkHKYLQx3oQXeEj1S5zWh32At2zgbWahQMTXHJNYlmdDZXO+ZZ/Da8E
	 NKb4s7z+vVztLt51j3CPpZKZZ9BPg+/9oBxukURuy6I6XIdjCamsBgddwJhfQjvlqhiwE
	 AQMt2dadpMpCHRRRn4bTXfG1JAHqrn7PBJQgJX9XiJU5pM6Wnn+N6VdMzPBSoVynfX+nk
	 AsUZ6joW0J/lYh/t7A7/uR9QWEipL9Vc9AylkqzUKTuSpqNLquuDZ16nYEfiBrELbbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f1JyRjZO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A927606A31C;
	Mon, 16 Nov 2026 19:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f1JyRjZO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04CEE1F000C4;
	Mon, 16 Nov 2026 19:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794858728;
	bh=XfsUca4ieNzhhEOE8BDvNJYRYK3NXV9a1RuC/4qrNNU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=f1JyRjZOuV03G3oUTE9FZjMYJE8jgzWiYIW+vQdeGIwPjV3TP3WiEEokgf3XUzNMz
	 UoKUioWmRU2c3MNTHs6lclGZspCw1CXrz6TBOkIPQUuEoYwc9H0rwe0KcnV+5lwXBJ
	 rO9THYxwVohl/4Pq8B18z9T3Z2uYVopJRGPdn/L7grOMSNMSQ2nwkTqpiXxjPB5bTz
	 tTU2FbSHMkaYgdZlPKF4fnmV/qhsD/jjB3OXkDq/SU4ZhhOQw2gq7h2fnKoBzvpkJr
	 9KQ3ATGpN8pCpO4589Ct3PTT72V8TJdrVHv12hiyDBwWZRkRaSV6mU5+A487Axn7Jj
	 ncels3Oa+qWLw==
From: Sasha Levin <sashal@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Sasha Levin <sashal@kernel.org>,
	Willy Tarreau <w@1wt.eu>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Theodore Ts'o <tytso@mit.edu>,
	David Hildenbrand <david@kernel.org>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: submitting-patches: ask bug fixes for their user-visible impact
Date: Mon, 16 Nov 2026 14:52:05 -0500
Message-ID: <20261116195205.335116-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116113453.013103c694ad966c56ddeb31@linux-foundation.org>
References: <20261116191436.188098-1-sashal@kernel.org> <20261116113453.013103c694ad966c56ddeb31@linux-foundation.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Nov 16, 2026 at 11:34:53AM -0800, Andrew Morton wrote:
>However, I fear that in these times this isn't strong enough.
>
>The question used to be "will this bug impact real-world people doing
>real-world things".
>
>That's an insufficient question to be asking now.  An additional
>question is "can this bug permit a sufficiently motivated, well funded
>and LLM-using Bad Actor to cause problems".

[...]

>Maybe this doc addresses that elsewhere, tl;dr ;)

It doesn't. The closest thing is the "send exploitable bugs to security@"
paragraph further down, and that assumes you already know it's
exploitable.

Willy pointed out the other side of this: ask an LLM for the worst case
and it'll stack up every config option, module and USB emulator needed
to get there, while for backports you also want to know whether
innocent users are affected at all.

I think both fit if we ask about the two cases separately. Something
like this on top?

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -63,14 +63,26 @@ from upstream, so include anything that could help route your change
 downstream: provoking circumstances, excerpts from dmesg, crash
 descriptions, performance regressions, latency spikes, lockups, etc.
 
-For a bug fix, this means saying what the bug does to a running system:
-the worst that a user can see, and what it takes to trigger it.  An
-account of what the code does wrong is not a substitute, as it leaves
-every reader to work the consequences out again.  If the bug was found
-by review or by a tool and has never been seen to happen, say so.  If
-it has no effect that a user could notice, say that too.  Maintainers
-and the people looking after stable trees decide from this whether the
-fix needs to be backported.
+For a bug fix, this means saying what the bug does to a running system.
+An account of what the code does wrong is not a substitute, as it leaves
+every reader to work the consequences out again.  Cover two cases:
+
+- Users who are not looking for the bug.  Say what a normal workload is
+  likely to run into, and separately what the worst case is and what it
+  takes to get there: configuration, hardware, privileges, timing.  If
+  the bug was found by review or by a tool and has never been seen to
+  happen, say so.  If it has no effect that a user could notice, say
+  that too.
+
+- Someone triggering the bug on purpose.  Say whether an unprivileged
+  user could do it and what that would take.  A race that no normal
+  workload loses can still be won by a program that retries it on every
+  CPU for an hour.  If that makes the bug a vulnerability under
+  Documentation/process/threat-model.rst, follow
+  Documentation/process/security-bugs.rst.
+
+Maintainers and the people looking after stable trees decide from this
+whether the fix needs to be backported.
 
 Quantify optimizations and trade-offs.  If you claim improvements in
 performance, memory consumption, stack footprint, or binary size,

If that works for both of you I'll fold it into a v2.

-- 
Thanks,
Sasha

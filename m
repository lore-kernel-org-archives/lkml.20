Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770FA569F34
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790096383; cv=pass; b=d6e3gOQvnnEWc8CZcvcvnBXSzccmIGNtiafXtXTQi/oxDmUO9/TkNGdqOKvP63MwmADT43bJPLkP3x8DlHeN9J+u96dqwPaE0mQWgksAwZsgx8s2rit7n8s1jIvG0Za1fwOvGi7lYdBlD7WlGrjweqyrEbDWJ8Fs7Gp0mh26ZsM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790096383; c=relaxed/simple;
	bh=LRn3GFzuUdLoBRg+/HP+f5teFv/89kmI0cipOvvuRfI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UAFG/WTRrpq6DpI/0a7+p9AFjIwVYGZxZ6J/cdgqeXEj/CEOHT7SwppWsDkQ38l2TpFlQBB0M6hkNdJLNH4Jgs5WXw9asrCQmtLupHWHlCaE+UD3et/YV0ZYPP56WFWaZAOZRSlKHtN83A0Zes4EscBrClW9WOcd5kJ898uP/84=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rGoBhlVO; arc=pass smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rGoBhlVO"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-52faa58bff5so4301cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:59:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790096380; cv=none;
        d=google.com; s=arc-20260327;
        b=eO57GxsD59N7i0MeO+lSlvKBYDUW/QpSkFEXMtbzLLXwAMeT3EJTna39ebXqCNBRXH
         G7UI9uNssvYvBoTMuz4e4B9Eo3C4cpgeq8jgrKxSRSiXLT4NlwCdoZdORFord9WANN3l
         6erobwKSNPcBYF2Y6JbpXoXh8915Y8xNjr7PXqR1XI0naP0WoPggjpqKAIMIWDcd3fCA
         9Vm8lAxtBo8XfzgTGl4/f7MQ6UQrKPVE0N+Ugyk4636AXK515lKbgGb7JEHGQ+G4eOd+
         4jn9YnYexJAm0xCqNpkEQNqiVBRF8Q0JRNWNcwLroqlyPrTUbomHq+QeKb+qqnaVcnhU
         w4bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HsqDw8925+XtaD9Vzbpc0jDahGyyPw4OUMTbUv1Lnh8=;
        fh=XqfL4tRy7fNxlDTCCEMIhIRSYM35NYf/Rt8gxbofBbo=;
        b=fhwFike2OlV5WxyerMVKZNrKYfJZfFQFDPcWuaxxdTKlCXn3hUggt1dQYYqfjXQKCF
         ++TVLZJyRMQZ1WcpgBJvTy158200Jjgjq23znCo4T9YMbDmqq5n+8tSm8V8++xUq00wV
         c7Sb1ujCUqufHQYK142BT1VX/gbZw0bWGllOCth/5CT1uP/eTGT+hyYWQkjWM0rtVW6u
         TGgIthKAZI6+GIf7eXywmf5nbltye1xh4hhYsLJgkMJFemIx1nwQ7/eMqmcrZzSXQe/5
         4R8RnUkJwP4KZwkVud27PpLks/fNPvKB4nfaSYf04WPwQWbub5h6oyD1yDPOjxmdqWL/
         Y0PQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790096380; x=1790701180; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HsqDw8925+XtaD9Vzbpc0jDahGyyPw4OUMTbUv1Lnh8=;
        b=rGoBhlVO0Jd3iktSiyOPyJu5xmKomRHa97tUnuj1unnjBd2bkchOh3UqkZx58TX/Vd
         O3XWqKK6qjdmcvH7ghod6BEV7d7ejB0RywJwzCJs+OlGPw6nXTXChxgUlKROB5P3NVsu
         UkxIGuQrkj0SF+++8MQ2uZjSbxMnfPF1IllaqeYRhPLXzHXTZslFie9d+bJmZsPkZUEf
         pRNIqIVh/sh21AfD/QU8JlvYA3mpst9IHY2zcPsnHr2rcsvkLE79uwwqs0urYw5DYavS
         MoDeV26vPSxxM6fhQ4lnpncU1yhX9y6CWxYlJWbIDSgGHnRdOZdIaVHE+O+TbAxjNLI2
         YSEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790096380; x=1790701180;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HsqDw8925+XtaD9Vzbpc0jDahGyyPw4OUMTbUv1Lnh8=;
        b=Qw7J/RCtstOkSmofcdG2lucKEYOc0tujxdMhdkqYvIEzTb5PMJssaFgpN0/WXEKiuR
         xxizoxQUGb2NLd3x0EqKdcoqc4Y3AXS+ZMEunFn8ijlHyaGaZVZKIcLFFEy7hR7uG+La
         MaYAKj0el3+hDmKc6rz2FV/dhcbFyLkjyrEqhhD+Z23aj/uLP6uS0zxYWXSfBaeGbD5h
         3jP/0Bh0EeEapdLs4mej/4cl8Wqkiqd2gorfHj9Uhe54OaWvrxLW4g+TYi6wNPEFMfXB
         U9mQX51iw8Rvvb3dRTraRV2h+DOSRULE1Vz5cuwZCQfiRoVluKC/xEwCpCHU/tR9EUoE
         3BUA==
X-Forwarded-Encrypted: i=1; AKwUvBw2PJ5fadrwJRFod2z6Nd8vyubVzTTzLNFgJvWNSGeba5aBr7nC//aZVe+gn0ZgLF5qhm1obrBwIbo2/Ds=@vger.kernel.org
X-Gm-Message-State: AFuF++kTTvYW+S2SlvTHXX/pHYzR+Kip7RbLxJGlHDmKqkNNCse7bdhZ
	kgDW/YoVFJokrUZcRyBCiQ/eoJaBJLeCldxtvUVsJHFVn9tx7tXyt1jUazReI35xjgBK3UsAdFL
	lfN8kBLcsOQiZzESWT5zTbRqx5732SszNyr6sv1AC
X-Gm-Gg: AYBFou2L+QODMQdsMsvXSL5Wz9woDBYRWt23hf3dMm6eRPNBVCjSQMS+XotPq7OEqof
	5GwCMwh5mSCqgdZdnptHtJtmQXCRTCRCNon1tdmmeFpsOy93lbVeJlhkeZBWwSM4toJ8SQiC6Ha
	SCoRw2lcJ7XiCXL0EmcbOIZ2vzMZDMao9zQP3Gcxd/5XdIjkjMX2twx33t/9tMYOGsr1QlkhAzU
	s9mldEbyMziCPBlbOocpwd3BKGAqJsoUyH4tq9ZlvAWHPfzCznCATeHUMQTbW0dx7hZpm6CTDjj
	ARNchtsdkDi9byDxem9Y8/569SG6PtsFxP3TWyzppfbnphmlHmcguylvAnYHAEZIQy1MlvAZ8KX
	i1xjjYKg=
X-Received: by 2002:ac8:58ca:0:b0:52f:9ed4:8d76 with SMTP id
 d75a77b69052e-532e8669213mr4171531cf.14.1790096379504; Tue, 22 Sep 2026
 09:59:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789966896.git.irogers@google.com> <7c56d15d6e61fabe8b94f5a98713305f15bf0848.1789966896.git.irogers@google.com>
 <56ea4b35-f73f-4e6e-95e4-f255eb089c5c@linaro.org>
In-Reply-To: <56ea4b35-f73f-4e6e-95e4-f255eb089c5c@linaro.org>
From: Ian Rogers <irogers@google.com>
Date: Tue, 22 Sep 2026 09:59:27 -0700
X-Gm-Features: AcwNN1Wxe4iKMPSdX4ghjuoW7LHjABByJQUuMgDPKi-P4xHVkR2Yf5ncUcs5YLY
Message-ID: <CAP-5=fXF=7AHVm2wKqvtFcQ1byc=-4kKvLb_1dQkge4tcQjX1Q@mail.gmail.com>
Subject: Re: [PATCH v2 13/49] perf build: Make mypy build test opt-out (NO_MYPY=1)
To: James Clark <james.clark@linaro.org>
Cc: adrian.hunter@intel.com, dapeng1.mi@linux.intel.com, leo.yan@linux.dev, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	tmricht@linux.ibm.com, acme@kernel.org, alice.mei.rogers@gmail.com, 
	linux-perf-users@vger.kernel.org, namhyung@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 6:11=E2=80=AFAM James Clark <james.clark@linaro.org=
> wrote:
>
> On 21/09/2026 06:06, Ian Rogers wrote:
> > Commit 168910d0f937 ("perf build: Add mypy build tests") added mypy as =
an
> > opt-in compile-time check (MYPY=3D1) because of existing mypy errors ac=
ross
> > perf Python scripts.
> >
> > Now that all Python scripts in tools/perf have been cleaned up and pass
> > mypy without errors, make the mypy build test opt-out (default on when
> > mypy is installed, disabled with NO_MYPY=3D1), matching NO_SHELLCHECK=
=3D1.
> > Set MYPYPATH to tools/perf/python so local imports resolve during type
> > checking, and clean *.mypy_log files in 'make clean'.
> >
> > Assisted-by: Antigravity:gemini-3.1-pro
> > Signed-off-by: Ian Rogers <irogers@google.com>
>
> Is there some minimum version or other setup requirement? I get this:
>
>
> pmu-events/amd_metrics.py:181: error: Unsupported operand types for +
> ("Event" and "object")  [operator]
> pmu-events/amd_metrics.py:182: error: Unsupported operand types for +
> ("Event" and "object")  [operator]
> pmu-events/amd_metrics.py:230: error: Argument 1 to "d_ratio" has
> incompatible type "object"; expected "int | float | Expression"  [arg-typ=
e]
> pmu-events/amd_metrics.py:231: error: Unsupported left operand type for
> + ("object")  [operator]
> pmu-events/amd_metrics.py:236: error: Argument 1 to "d_ratio" has
> incompatible type "object"; expected "int | float | Expression"  [arg-typ=
e]
> pmu-events/amd_metrics.py:236: error: Unsupported left operand type for
> + ("object")  [operator]
> Found 6 errors in 1 file (checked 1 source file)
> make[3]: *** [pmu-events/Build:192:
> /home/james/workspace/linux/build/local/pmu-events/amd_metrics.py.mypy_lo=
g]
> Error 1
> make[2]: *** [Makefile.perf:562:
> /home/james/workspace/linux/build/local/pmu-events/pmu-events-in.o] Error=
 2
> make[2]: *** Waiting for unfinished jobs....
> python/ilist.py:13: error: Cannot find implementation or library stub
> for module named "textual"  [import-not-found]
> python/ilist.py:14: error: Cannot find implementation or library stub
> for module named "textual.app"  [import-not-found]
> python/ilist.py:15: error: Cannot find implementation or library stub
> for module named "textual.binding"  [import-not-found]
> python/ilist.py:16: error: Cannot find implementation or library stub
> for module named "textual.containers"  [import-not-found]
> python/ilist.py:17: error: Cannot find implementation or library stub
> for module named "textual.css.query"  [import-not-found]
> python/ilist.py:17: note: See
> https://mypy.readthedocs.io/en/stable/running_mypy.html#missing-imports
> python/ilist.py:18: error: Cannot find implementation or library stub
> for module named "textual.command"  [import-not-found]
> python/ilist.py:19: error: Cannot find implementation or library stub
> for module named "textual.screen"  [import-not-found]
> python/ilist.py:20: error: Cannot find implementation or library stub
> for module named "textual.widgets"  [import-not-found]
> python/ilist.py:21: error: Cannot find implementation or library stub
> for module named "textual.widgets.tree"  [import-not-found]
> Found 9 errors in 1 file (checked 1 source file)
> make[3]: *** [Build:91:
> /home/james/workspace/linux/build/local/python/ilist.py.mypy_log] Error 1
> make[3]: *** Waiting for unfinished jobs....
> python/treport.py:12: error: Cannot find implementation or library stub
> for module named "textual"  [import-not-found]
> python/treport.py:13: error: Cannot find implementation or library stub
> for module named "textual.app"  [import-not-found]
> python/treport.py:14: error: Cannot find implementation or library stub
> for module named "textual.binding"  [import-not-found]
> python/treport.py:15: error: Cannot find implementation or library stub
> for module named "textual.color"  [import-not-found]
> python/treport.py:16: error: Cannot find implementation or library stub
> for module named "textual.scroll_view"  [import-not-found]
> python/treport.py:17: error: Cannot find implementation or library stub
> for module named "textual.strip"  [import-not-found]
> python/treport.py:18: error: Cannot find implementation or library stub
> for module named "textual.widgets"  [import-not-found]
> python/treport.py:19: error: Cannot find implementation or library stub
> for module named "textual.widgets.tree"  [import-not-found]
> python/treport.py:19: note: See
> https://mypy.readthedocs.io/en/stable/running_mypy.html#missing-imports
> Found 8 errors in 1 file (checked 1 source file)

Thanks James! So there are 2 issues, and I'll fix the code in v3. The
first issue is that in older mypys the join the plus operator isn't
computed correctly and this can be fixed with a type annotation. The
textual issue is resolvable by running mypy with
--ignore-missing-imports.

Thanks,
Ian

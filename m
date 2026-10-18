Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCB43A0E93
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 10:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792320486; cv=none; b=ifZmEnvneRLd3+CiyJpnPgKC0hAyQKD57rtICIoQE86NGQa74KVSA/g6/Cp0DAfKIdfEB5paJGGPDDt+LJCz3JK5NV+BWhNBQ4B7DS6bqODcYraiNlMB2qLRlIwbiP1XSVbyqaML9kmuitfL67CFNoC/1Rxo3TQ4KWahYXRjDt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792320486; c=relaxed/simple;
	bh=DFCjCSJH5PPRg/VGhs8ZLbNwY/QtjT1rjo+wp7x92r8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TFZU6AVjDWOtdc4Ymv2An/yISGwcOYkDxWI8X5ZdurAKFp+ZnjvOVSX3/C0I1Advv0UcogVeegqUIN//TBsXHUCQf/e/iGTBKwese59jrv3KTQcj7pyKaTstyLDgB7lGpc6xT1VX/ZpjUckT5gz/dnE0ZLdxin+X35ew/J+VGyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I13rQPet; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I13rQPet"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1C401F000C4;
	Sun, 18 Oct 2026 10:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792320484;
	bh=2IUFtX59Pe0wkrprj7ej/Id+frKkMCEyf9XB2RpfEsA=;
	h=Date:From:To:Cc:Subject;
	b=I13rQPet/phZBD5MFlD9PewjCPvJxvyO27Lsd25Z9B2curT0BxsNnImiucEovx6Bw
	 JLWZ22p/DvZCrPonPxghou6B6toklOb24VlYORrP2WuMur4CyNOitMrqK4gjQfH+tZ
	 3DzX/4PvnPrduxj5md9991wXvTUWS8lp7S1aYtEeOrhplGXOG66JHuzeF7lu6rHIh4
	 nQGgoAqBYTRda4eydmZoTNrZJKo0SweUcIJxmls2E6Aj40Qw8SxgomaUhr6bh8pYX7
	 xkuh+yZaPYFZn07aDllkwjaoGvA1R/qnREFVVtEBZr839n5a6GSQu+YjPwc/hHijyw
	 L5rC2wsUU9Iug==
Date: Sun, 18 Oct 2026 12:48:00 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: [GIT PULL] x86/core update
Message-ID: <atSj4N3ZQycIAEyw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull the latest x86/core Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-core-2026-10-18

for you to fetch changes up to 41d1119e2f8577b4bd01d31321c6761af9140ce7:

x86/core update:

 - Emit the FineIBT paranoid "cs" prefix as a byte,
   to work around a GNU toolchain build warning (Kees Cook)

 Thanks,

	Ingo

------------------>
Kees Cook (1):
      x86/kcfi: Emit the FineIBT paranoid "cs" prefix as a byte


 arch/x86/kernel/alternative.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

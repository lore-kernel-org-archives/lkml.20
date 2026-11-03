Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793717967;
	b=UfktYrBYSeIgxzPpY93mVZilKRH1+PLBJ3OYoFHVsLjasiMQqbx486SPe4Ru7eWo+955
	 vzOR1+ZYbh3Wq63YGA47HI7pAWb6N4ZKt6EZm4bCXeF+5iuI6K5C78Iw6ByIA53yEzrIQ
	 ZRRbJ5dTnBjtsUFi4FZqIe0GfJFm3Isd0hvGhEVEAEM3AFCISENCKLDjsWVUCvIixe8iz
	 vievVkc2l3fXb7WygK02YCyPH55uvbA8+lLxCV4e8wje4dHvZJbY4XMbtEjW2grDY0/IZ
	 hC8UKtP3JkAaJL5r8ecrp0kO37yx6p+Iyja+Vwl8TJAEUgLVoRKqpx0dzm4eYTXkONQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793717967;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=QOOunG6x00mFeX/w/BnxH7O4uOunqE+8oUGxItzATdk=;
	b=FODlVbn1w9pO7igfqfxUlJ2Sv2ewsYIJ6kENpmlhOGigkXmgPjzNHN/xqYWwsDqzH2me
	 K4PW8Hg0YdwdSDW017QS8XIXwm5jRndrIeQ0yE1CFNigX6OgNAlEWDEFc8izxt8giOkE+
	 f93Ue1w+y8lvLN6jeMtBdnOZ/qBRRkWI6ckS2cHln8SewDSOIVw/Xkc69JOUsfhzEWkyx
	 np/kVebUjKtB2WtoU56Tjf2bXuqzSWlyr0BeYymCB7WIaxK+IScPzqHN27Q/KRVI0SJPf
	 Lx2U2Iz/UOr8VpW7oe3+KO15ijrq/VSDLvglNj/dj6ftdbJRY3fP/j6WpchAFvUGslg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KwPLw8iM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CD9606BA15;
	Tue,  3 Nov 2026 14:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KwPLw8iM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44FA71F000C1;
	Tue,  3 Nov 2026 14:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793717966;
	bh=QOOunG6x00mFeX/w/BnxH7O4uOunqE+8oUGxItzATdk=;
	h=From:To:Cc:Subject:Date;
	b=KwPLw8iM34+GvDWpXRn2Qk8kaaFw+xTRTbO0wP6xXONGTNYdC+FO/VBJgaYxNuPw+
	 MCVn0zi8zem0QPnXDxgl2iyqx/dEmryVQTzh4ELr/fIliRqjxnDGlA06M/+ueGPRD9
	 ImqLuWyacvMaeup2FkUAx+5n7b8/HdxNABmDPCxxF6bvRtA/inNwxnEBS1GMgjh6EO
	 7ccz3kY/MF501KOz0iEGAWwKQ7gMXX2owHIpSKOkeRAoh+/dIj0Zi19Mj6KExVRIiU
	 9on7CyBGTS44PWpddAUvLk4PxSQ2oVetK/MkXtX6UsUHVlQ1n9ufAqLm+ulQijVNdy
	 eOXnwdlOdOE7Q==
From: Thorsten Blum <blum@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Arnd Bergmann <arnd@arndb.de>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Karl Mehltretter <kmehltretter@gmail.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Marco Elver <elver@google.com>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Jeff Layton <jlayton@kernel.org>,
	x86@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thorsten Blum <blum@kernel.org>
Subject: [PATCH RESEND 0/3] x86/vdso: Improve vdso=/vdso32= boot parameter validation
Date: Tue,  3 Nov 2026 15:58:49 +0100
Message-ID: <20261103145848.427309-5-blum@kernel.org>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=881; i=blum@kernel.org; h=from:subject; bh=uwB5tWMT98tHP7TVpJKSs4ixsyhtyBoJgd2JGHUineg=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFkvv614yuRlc+BOaBW3aNHVy56crxf6rft7/c5Uf/53A r0+dVYyHaUsDGJcDLJiiiwPZv2Y4VtaU7nJJGInzBxWJpAhDFycAjCROxsY/grN7Cow9/eV9u4K WXq/zyB4i4rBFdZnMfEVRwQjnE2nGDEynNXJfP+6NEnp3jzu9beTy9znM9zf9a7p1v2axTdclk8 qZwMA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

Replace the deprecated simple_strtoul() [1] with kstrtouint() when
parsing the vDSO boot parameters. This provides strict input validation,
rejects partial input, and warns when disabling vDSO for invalid values.

Adjust both warnings for consistency and update the documentation.

[1] https://www.kernel.org/doc/html/latest/process/deprecated.html#simple-strtol-simple-strtoll-simple-strtoul-simple-strtoull

Thorsten Blum (3):
  x86/vdso: Use kstrtouint() to validate vdso= boot parameter
  x86/vdso: Use kstrtouint() to validate vdso32= boot parameter
  Documentation/arch/x86: Remove obsolete vdso32=2 compatibility note

 Documentation/admin-guide/kernel-parameters.txt |  5 +----
 arch/x86/entry/vdso/vdso32-setup.c              | 10 ++++------
 arch/x86/entry/vdso/vma.c                       |  6 +++++-
 3 files changed, 10 insertions(+), 11 deletions(-)

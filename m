Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E55470EA0
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791933666; cv=none; b=CGkFygkYMWV2HrPNDW+kvn/CgkG6vajixgslv9np7Bl8svxL1qbq9M63TXa+RVVdyY3NG6fT8w5lh5QjImOiVwKT92uj25+OH2Tt1DgSHFQWt3Ir9vNmefEpcIFdgcydfqnwnArez+CfdIq2JFJIPvVJwpMc2CxgEt8/GmNiRMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791933666; c=relaxed/simple;
	bh=sa3d8/vwB+vsBUlUbAcJ3HSGe456QPjDRiPHfkMu+s4=;
	h=Date:From:To:Cc:Subject:Message-Id:Mime-Version:Content-Type; b=FzSc8xEdXEYKJrnXa69upfVx+E1SGOGGHUWFAYL3IrtOAF9On1+RwqEhDaO6bGFuHABypXjVfCkk6bL/sP8+kj3hmiRh66wXzZu1FseCPtwt0GsEmiaTsPTiyqBlAW8ToziUN4k+aHvu1Wm5Su7ztj9G/YXlgQvJyO3P7HPYcf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZYX4V4ib; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZYX4V4ib"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 831971F000FF;
	Tue, 13 Oct 2026 23:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791933662;
	bh=AGprV/YgL6eBWf+vFomsgtLhckWQ21DbF5S2LSsQouk=;
	h=Date:From:To:Cc:Subject;
	b=ZYX4V4ibvIC7vGBA2XXvLDooG5zjykJe9Udor3Uy9OEE2VSDvvgbLkiZVIyZm5HfW
	 uBjnViqPKvjrsfzkjrPjbq+RzJaf1NJO+/nh5pkvVahQi1XGHb4ElGrI2ThcDg/rq5
	 SUyWlytjOtZklBaJyfz0R09RMcFZuKGfsJyjf4xoF4aKZvpFF/6jAsrGkQfe31Mcjg
	 1+cVBufYrg6AB6ophlYL6OCT8hq3bWAeVk+9FNzvdtK2UCkHSeTg1UarwT33kopN+s
	 qAK4vCK6pxrujTOoma4U8MV7U5qRMgeLoSMpuACzk/4U8Uw7jvJNGdhhqArqboYuoN
	 SQHo/RrP/RhEg==
Date: Wed, 14 Oct 2026 08:20:58 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Sasha Levin <sashal@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, linux-kernel@vger.kernel.org
Subject: [GIT PULL] bootconfig: Fixes for v7.3-rc7
Message-Id: <20261014082058.e42e2b558ebb712bfc0f28fc@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Linus,

Bootconfig fixes for v7.3-rc7:

- bootconfig: give the footer size static_assert a message
   Add a message to static_assert() macro because it is required for
   the compiler before C23. This fixes a warning.


Please pull the latest bootconfig-fixes-v7.3-rc7 tree, which can be found at:


  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
bootconfig-fixes-v7.3-rc7

Tag SHA1: 15cf6dec78bb629a26494361097c4850c6956d83
Head SHA1: a1ddc2721467fb68241372db77657fd0dcf6cda5


Sasha Levin (1):
      bootconfig: give the footer size static_assert a message

----
 tools/bootconfig/main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
---------------------------
commit a1ddc2721467fb68241372db77657fd0dcf6cda5
Author: Sasha Levin <sashal@kernel.org>
Date:   Sun Oct 11 18:33:41 2026 -0400

    bootconfig: give the footer size static_assert a message
    
    static_assert() without a message is a C23 feature, so clang warns:
    
      main.c:498:56: warning: '_Static_assert' with no message is a C23 extension [-Wc23-extensions]
    
    Add a message.
    
    Link: http://lkml.kernel.org/r/20261011223358.2327625-13-sashal@kernel.org
    
    Fixes: 6ed5e20466c79 ("bootconfig: Fix unaligned access when building footer")
    Cc: stable@vger.kernel.org
    Assisted-by: LLM
    Signed-off-by: Sasha Levin <sashal@kernel.org>
    Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

diff --git a/tools/bootconfig/main.c b/tools/bootconfig/main.c
index 17d971d47f87..df0534035857 100644
--- a/tools/bootconfig/main.c
+++ b/tools/bootconfig/main.c
@@ -495,7 +495,8 @@ static int apply_xbc(const char *path, const char *xbc_path)
 	footer.size = htole32(size);
 	footer.csum = htole32(csum);
 	memcpy(footer.magic, BOOTCONFIG_MAGIC, BOOTCONFIG_MAGIC_LEN);
-	static_assert(sizeof(footer) == BOOTCONFIG_FOOTER_SIZE);
+	static_assert(sizeof(footer) == BOOTCONFIG_FOOTER_SIZE,
+		      "bootconfig footer size mismatch");
 	memcpy(data + size, &footer, BOOTCONFIG_FOOTER_SIZE);
 
 	total_size = size + BOOTCONFIG_FOOTER_SIZE;
-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793364737;
	b=s1OOcIPXrzhRras+oNfmmUdPH8iZREatnkTGoVp7Ow9L81MlHbmScOMfkFrxQQ6v9YFb
	 PMVMGzpUCM2OTVHwCofjT8ofOFDDtz27oaHbnL/PLfQe6OoxLgHxAh96NX/DVCZw5do33
	 Ftl2DhRV/zxKS1jI+CDyjgVVLg2U3mRmCfnPsfTvEXdW1rOMHLfb6JL4p3RnKIhoK6i9d
	 hxLsDpeUqheJr5eYIUtTLL6sc0rC2X2Q1UYnRvzTYOWwNHOZ9NTK/0ME3KFO6elOSI3zI
	 llHlhdQQWOCaVbn5qYKIZBt3W8nGxFx1Rhkmq/ixfzNqe+vW4klp0MJwT7TAps9nW+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793364737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3wEqCnXTJdlE03KrHWY7VarW5N0vNs2ZED7L58Yvpi0=;
	b=HunlBWWfgFUsBvLaClTPmCVlZHPBJzyxsbzribVUQf9b2Uw6NBpu71yj00lOifjThY/H
	 dSTVmzZWOnj6ttYZ/rg6kMGDOjo6Tc3eQXzrhNYknTbNE76soKcv66DT85cT72Bu7Vvtg
	 Pg4FzZChUvNh+NVa07CV8xtF188isDUJ/lz9k6CebpQ5TaUYdd6FMg9/KxP1Q3uk+KaXR
	 shv7MU4V05aOG9/wJ8pNKf8/To0qywShQuXya5sZXkyx6b7u9/U+TAuQqPy7xU2E5k8Vv
	 wL6PRg/sLdFHUdWAmwS0U+NUsiF4dAvGVeIFp4NPeoPSK3aSiXlFp9odcsUTpj6yplQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QxY32tUv;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7819D606A333
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:52:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7819D606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QxY32tUv
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48dee593f18so567205f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 05:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793364731; x=1793969531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3wEqCnXTJdlE03KrHWY7VarW5N0vNs2ZED7L58Yvpi0=;
        b=QxY32tUvnWs7viGQJ0XZgaAd80fTZU3QcbZDkWyuOD+bWe3SdyAnFYsQesGkthYgBn
         7SxBn5KJDQgNx1c51eyfCyi9oeSiVbzX/CHPkXAVj/r8aBMZk+Q8P4fcTuGeajX2EHme
         A7D2KaATNPspXRe2ZbWsl21Ir3fQXB3XcpzrDeSAdhhf+mq1+5OO1P/CuRPCk+BG6WPI
         eld1qqwUlsDz7+mb3UPKmnGSs8bEFaot3P/XE3+FZc1TggI8GBCMjeqI5U8adrcZtXNK
         T4vc0E/HFlMqaO/i+SWpucA/TdpZhvrcpCU2gbrfkQsVLnIx11bETVQP29DotxvBG0Ql
         HPmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793364731; x=1793969531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3wEqCnXTJdlE03KrHWY7VarW5N0vNs2ZED7L58Yvpi0=;
        b=aGxsTDZ0zD4n1XIo34UfLi2yZZGYo/EtjwezVbArNQAscZAUmLD6ojRmukKSifm7bU
         +gxFCRVm1f5MFPVBeGZERb3AXQKhJ/m1+4Imm6b5WvvggronYLHH2FGck3olWv0A3OkO
         ozrmQ0BC6PDirbWcvd+9ygBW+7r+zRLFSdqTjFknQzgnOw1kISq5FVPbfN8MxF/duHpe
         sU+B517Npcq61GVeOBPq5RKQPAa7Xfm2ksVt5I2lzp6Vgfl1tm2FRF8pKDpKHd5pX4so
         Bf5szP0NB71yFcAqXe+fNBu5RXa6LA7Vm6OsNA1RC3nSwD/3jGeBfNzf1vaDhd4rd6Y2
         OunQ==
X-Forwarded-Encrypted: i=1; AKwUvByE9DeJX7sI7mIewLh0N//HUs9XIm9M33Nd5XY0+hrvsIMXQQMjOYEqzUNAP9NtcgJ28maEVqm5AjA/BQ8=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/Dnf32xc1NfKRhFdbwTOTfOrnvgT9XB8cx451B5krUz1NVOys
	LuTN3APsCsuK7AvI9BiDg4ITQb44AJj1JAFeii8C7b1vfmElWqXYXXi85EevWueV3IH5Ng==
X-Gm-Gg: AYBFou3PN0PEEMEQ/8V/3uHJwx/WwlfzYu/c+Ew381U46y8xuCRafVQ84DhIldxSJ5Q
	FW4+Hf3P6rDxY7gzr1CjHSItmqKTTT8Od7fqvBYqB22yI/qBUHD4oA/yf9oNgjEIpDoqksig0fR
	0Uv5wsRKVBWXRxXReLYgbMM5JSDuhuvl8dINnaBh2AI7Kr/0w28c7HVKe8I7J3eHtW+opzPMWla
	jwqrq1vAp3YXvv8eXjYiBTmXXH1UDlFq/qzaP9XxQyEs1OmgRf1qMx8jhL9SQgjnUT4Fq283JRI
	6x+39JRrN/TlU3L0xHfmPBZLw9IL82VWv0dX//Vy/AU17JE4jL+RkmMUOIhGby1gwy9PpTRoJfL
	eNFLqDTI0LCMH/gMiTONAOf9WPpk1fRhUP8HgMoijN3xpmCMWo8RY2U7f1+bOxpvht+ESicRre3
	xN+QL4vdnJeilwfyyCA1K1xTvCe9vCk5YnoaF3aC4mApV7BIghTfNc/NQWUFyajGJbq/DfXVG2L
	xwuxJ4+48xEm7iZYbopB0gd0JQb+AJyOc5NmsD/OdZzhm5MyBm8WowTiC4rAQgdagc6DSs20t8E
	1T+zTA7xiJ3g55SjDWD/5RETRL1+lvB1y2ZtK3K/00cWJGLNGCPvRDzNPY4n0Yl0YC+0I7lfmnm
	GvidQGemfnUObIzkrARw4P83KEWjXBkuD9KbxqDvFOoHunnYHU8wGu4R8M50gMia8qTcw1I/aNE
	BR4xt3ISZHqz9J4D5Zpgz4rJqWl7JcRX9djr1zLyWu+DOaTquaPn/X1k31SPos+vMbIaKhXTHqA
	cV7KBJs
X-Received: by 2002:a5d:64c4:0:b0:48d:facb:5937 with SMTP id ffacd0b85a97d-48e6e2b9ed0mr5326056f8f.7.1793364730865;
        Fri, 30 Oct 2026 05:52:10 -0700 (PDT)
Received: from longitude (2a02-8434-fda5-4201-a479-65ed-4521-39bf.rev.sfr.net. [2a02:8434:fda5:4201:a479:65ed:4521:39bf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b723cdsm3170047f8f.12.2026.10.30.05.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 05:52:10 -0700 (PDT)
From: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
To: mhiramat@kernel.org
Cc: rostedt@goodmis.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] tools/bootconfig: Quote event filters in ftrace2bconf.sh
Date: Fri, 30 Oct 2026 13:51:48 +0100
Message-ID: <a60d6ff14ecfc1ea7a20444fd61c5ca47385e163.1793364709.git.edumucelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1793364709.git.edumucelli@gmail.com>
References: <cover.1793364709.git.edumucelli@gmail.com>
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

ftrace2bconf.sh emits event filters without enclosing bootconfig quotes.
A filter such as prev_comm == "a,b" is therefore parsed as an array,
while a # truncates the value and a semicolon or closing brace can make
the exported configuration invalid.

Quote filters containing bootconfig delimiters so that the complete
expression remains one value. Choose the enclosing quote in the same
way as the bootconfig utility. Leave filters without delimiters as they
are, including expressions that contain both kinds of quote.

Fixes: 2b86062a34a8 ("tools/bootconfig: Add a script to generates bootconfig from ftrace")
Signed-off-by: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
---
I tested event filters containing a comma, semicolon, # and closing
brace in a temporary tracefs instance on my Ubuntu machine, running
kernel 7.0.0-38-generic, with recording disabled.

The original export split or truncated these filters, or produced a
config that could not be parsed. With the fix, each expression remained
one value and was restored unchanged. A filter containing an ordinary
space worked in both versions.

 tools/bootconfig/scripts/ftrace2bconf.sh | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/bootconfig/scripts/ftrace2bconf.sh b/tools/bootconfig/scripts/ftrace2bconf.sh
index b01297217cf3..8c5889d0420c 100755
--- a/tools/bootconfig/scripts/ftrace2bconf.sh
+++ b/tools/bootconfig/scripts/ftrace2bconf.sh
@@ -126,6 +126,14 @@ per_event_options() { # event-dir
 	fi
 	val=`cat $evdir/filter`
 	if [ "$val" != "none" ]; then
+		case "$val" in
+		*[',;#}']*)
+			case "$val" in
+			*\"*) val="'$val'";;
+			*) val="\"$val\"";;
+			esac
+			;;
+		esac
 		emit_kv $PREFIX.event.$group.$event.filter = "$val"
 	fi
 }
-- 
2.53.0

